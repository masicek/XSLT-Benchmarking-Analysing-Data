#!/usr/bin/php -q
<?php

/* 
 * Scan all files (by input) and report all features into files (by input)
 */


/* --- INIT --- */
// Input and otput files
$opts = getopt('f:e:d:v:x:o:n:r:p:a:');
$filesPath = $opts['f'];
$elementsPath = $opts['e'];
$depthPath = $opts['d'];
$versionPath = $opts['v'];
$xpathPath = $opts['x'];
$fanoutPath = $opts['o'];
$nestingPath = $opts['n'];
$recursionPath = $opts['r'];
$outputPath = $opts['p'];
$proceduralPath = $opts['a'];


// Main variables with information about files
$elements = array();

// Watch attributes
define('ALL_VALUES', '##___all_values___##');
$attributesWatched = array(
	'template' => array(
		'match' => array(),
		'name' => array()
	),
	'output' => array(
		'method' => ALL_VALUES
	)
);

// Watched XPath
$xpathWatched = array(
	'apply-templates' => array('select'),		// XPath
	'copy-of' => array('select'),				// promenna, ...
	'for-each' => array('select'),				// XPath
	'param' => array('select'),					// XPath
//	'sort' => array('select'),					// XPath
	'value-of' => array('select'),				// XPath
	'variable' => array('select'),				// XPath
//	'with-param' => array('select'),			// XPath
//	'key' => array('match', 'use'),				// XPath
	'if' => array('test'),						// expression - in XPath in []
	'when' => array('test'),					// expression - in XPath in []
//	'number' => array('count', 'from', 'value')	// XPath
	'template' => array('match')				// XPath
);

// Name of key saved elements/attributes/values number
define('COUNT', '___count');
// Command for Saxon XSLT Parser
define('SAXON', 'java -jar ../../saxon9he.jar');
// XSLT Stylesheat for counting of fan-out of files
define('FANOUT', './fanout.xslt');



// OPEN ALL NECESSARY FILES
$fFiles = fopen($filesPath, 'r');
$fElements = fopen($elementsPath, 'w');
$fDepth = fopen($depthPath, 'w');
$fXpath = fopen($xpathPath, 'w');
$fVersion = fopen($versionPath, 'w');
//$fFanout = fopen($fanoutPath, 'w');
$fNesting = fopen($nestingPath, 'w');
$fRecursion = fopen($recursionPath, 'w');
$fOutput = fopen($outputPath, 'w');
$fProcedural = fopen($proceduralPath, 'w');


// Get xml reader
$reader = new XMLReader();



// Variable for recurssion counting
$recursion = array();
$recursionActualTemplateName = NULL;
$recursionWayAll = array();
$recursionWayMax = 0;


// FUNCTION FOR DETECT RECURSION
function recursion($way)
{
	// Variable for recursion counting
	global $recursion;
	global $recursionWayAll;
	global $recursionWayMax;
	
	$lastStep = end($way);
	if (isset($recursion[$lastStep]))
	{
		foreach ($recursion[$lastStep] as $child => $tmp)
		{
			// detect cycle
			$search = array_search($child, $way);
			if ($search === FALSE)
			{
				// no cycle => next step
				array_push($way, $child);
				recursion($way);
				array_pop($way);
			}
			else
			{
				// cycle found => stop recucursion and save it				
				// control existenc same cycle
				$cycle = array_slice($way, $search);
				$add = TRUE;
				$cycleUnshifted = $cycle;
				for ($shift = 0; $shift < count($cycle); $shift++)
				{
					foreach ($recursionWayAll as $cycleOld)
					{
						if ($cycle == $cycleOld)
						{
							$add = FALSE;
							break;
						}
					}
					if ($add == FALSE)
					{
						break;
					}
					$first = array_shift($cycle);
					array_push($cycle, $first);
				}
				if ($add == TRUE)
				{
					$recursionWayAll[] = $cycleUnshifted;
					if (count($cycleUnshifted) > $recursionWayMax)
					{
						$recursionWayMax = count($cycleUnshifted);
					}
				}
			}
		}
	}
}


/* --- SCAN ALL FILES --- */
while ($filePath = substr(fgets($fFiles), 0, -1))
{
	// Init xml reader
	$reader->open($filePath);
	
	// Init variable with detph
	$depthMax = 0;
	
	// Init variables about nesting
	$foreachMax = 0;
	$ifMax = 0;
	$chooseMax = 0;
	$foreachActual = 0;
	$ifActual = 0;
	$chooseActual = 0;
	
	// Variables for recursion counting
	$recursion = array();
	$recursionActualTemplateName = NULL;
	$recursionWayAll = array();
	$recursionWayMax = 0;
	
	// Variables for output
	$outputDefault = 'xml';
	$outputSet = NULL;
	
	// Variables for procedural vs. non-procedural
	$countTemplateMatch = 0;
	$countTemplateName = 0;
	
	
	// SCAN ONE FILE
	while ($reader->read())
	{
		// --- PREPRARE ---
		// Get only start of elements with their attributes
		if ($reader->nodeType != XMLReader::ELEMENT)
		{
			if ($reader->nodeType == XMLReader::END_ELEMENT)
			{
				if ($reader->localName == 'for-each') $foreachActual--;
				if ($reader->localName == 'if') $ifActual--;
				if ($reader->localName == 'choose') $chooseActual--;
				if ($reader->localName == 'template') $recursionActualTemplateName = NULL;
			}
			
			continue;
		}
		
		
		// OUTPUT - default - 1. part
		if ($reader->prefix == '' && $reader->localName == 'html')
		{
			$outputDefault = 'html';
		}
		
		
		// Scanning only elements from xsl namespace
		if ($reader->prefix != 'xsl')
		{	
			continue;
		}
		
		$elementName = $reader->localName;
		
		
		
		// DEPTH
		if ($reader->depth > $depthMax) $depthMax = $reader->depth;
		
		
		// OUTPUT - default - 2. part
		if ($elementName == 'element' && $reader->moveToAttribute('name') && $reader->value == 'html')
		{
			$outputDefault = 'html';
		}
		
		
		// NESTING elements
		if ($elementName == 'for-each') $foreachActual++;
		if ($elementName == 'if') $ifActual++;
		if ($elementName == 'choose') $chooseActual++;
		
		if ($elementName == 'for-each' && $foreachActual > $foreachMax) $foreachMax = $foreachActual;
		if ($elementName == 'if' && $ifActual > $ifMax) $ifMax = $ifActual;
		if ($elementName == 'choose' && $chooseActual > $chooseMax) $chooseMax = $chooseActual;
		
		
		// VERSION of XSLT
		if ($elementName == 'stylesheet' && $reader->moveToAttribute('version'))
		{
			fwrite($fVersion, $filePath . ' ' . $reader->value . "\n");
		}
		
		
		// OUTPUT of XSLT
		if ($elementName == 'output' && $reader->moveToAttribute('method'))
		{
			$outputSet = $reader->value;
		}
		
		
		// PROCEDURAL vs. NON-PROCEDURAL
		if ($elementName == 'template' && $reader->moveToAttribute('name'))
		{
			$countTemplateName++;
		}
		if ($elementName == 'template' && $reader->moveToAttribute('match'))
		{
			$countTemplateMatch++;
		}
		
		
		// XPATH
		// TODO pridat kontextove rozliseni (vipsat si XPath pro dane elementy, ...)
		if (isset($xpathWatched[$elementName]))
		{
			foreach ($xpathWatched[$elementName] as $attributeName)
			{
				if ($reader->moveToAttribute($attributeName))
				{
					fwrite($fXpath, preg_replace('/[ \n\t]+/', ' ', $reader->value) . "\n");
				}
			}
		}
		
		
		// NUMBER OF ...
		// ... Elements
		$elements[$elementName][COUNT]++;
		
		// ... Attributtes (watched)
		if (array_key_exists($elementName, $attributesWatched))
		{
			foreach ($attributesWatched[$elementName] as $attributeName => $values)
			{
				if ($reader->moveToAttribute($attributeName))
				{
					$elements[$elementName][$attributeName][COUNT]++;
					
					// ... Value of attributes
					if ($values == ALL_VALUES)
					{
						$elements[$elementName][$attributeName][$reader->value][COUNT]++;
					}
					else
					{
						foreach ($values as $value)
						{
							if ($reader->value == $value)
							{
								$elements[$elementName][$attributeName][$value][COUNT]++;
							}
						}
					}
				}	
			}
		}
		
		
		// RECURSION
		if ($elementName == 'template' && $reader->moveToAttribute('name'))
		{
			$recursionActualTemplateName = $reader->value;
			$recursion[$recursionActualTemplateName] = array();
			
		}
		if (is_null($recursionActualTemplateName) === FALSE && $elementName == 'call-template' && $reader->moveToAttribute('name'))
		{
			$recursion[$recursionActualTemplateName][$reader->value] = NULL;
		}
		
	}
	
	
	/*
	// FAN-OUT
	$fanout = explode(',', substr(exec(SAXON . ' -versionmsg:off -s:' . $filePath . ' -xsl:' . FANOUT), 0, -1));
	sort($fanout, SORT_NUMERIC);
	$fanoutAvg = round(array_sum($fanout) / count($fanout));
	$fanoutMin = $fanout[0];
	$fanoutMax = $fanout[count($fanout)-1];
	fwrite($fFanout, $filePath . ' ' . $fanoutAvg . ' ' . $fanoutMin . ' ' . $fanoutMax . "\n");
	*/
	
	// Report max depth of file
	fwrite($fDepth, $filePath . ' ' . $depthMax . "\n");
	
	// Report nesting
	fwrite($fNesting, $filePath . ' ' . $foreachMax . ' ' . $ifMax . ' ' . $chooseMax . "\n");
	
	
	// Detect recursion
	// HACK: count recursion of this file is to long
	// we counted this file separateli, then we can set the value by hand
	if ($filePath == '../data/www.omg.org/spec/BPMN/2.0/20100501/BPMN20-ToXMI.xslt')
	{
		$recursionCount = 8799;
		$recursionWayMax = 18;
	}
	else
	{
		foreach ($recursion as $parent => $childs)
		{
			recursion(array($parent));
		}
		$recursionCount = count($recursionWayAll);
	}
	
	
	// Report recursion
	fwrite($fRecursion, $filePath . ' ' . $recursionCount . ' ' . $recursionWayMax . "\n");
	
	
	// Report output
	if ($outputSet)
	{
		$outputFinal = $outputSet;
		$outputUsed = 'set';
	}
	else
	{
		$outputFinal = $outputDefault;
		$outputUsed = 'default';
	}
	fwrite($fOutput, $filePath . ' ' . $outputFinal . ' ' . $outputUsed . "\n");
	
	
	// Report procedural vs. non-procedural
	if ($countTemplateMatch == 0)
	{
		if ($countTemplateName == 0)
		{
			// using default XSLT rules  =>  non-procedural
			$procVSnonproc = 'non-procedural';
		}
		else
		{
			// some NAME and any MATCH  =>  procedural
			$procVSnonproc = 'procedural';
		}
	}
	else
	{
		// NAME : MATCH > 2 : 1  =>  procedural (other non-procedural)
		$procVSnonproc = ($countTemplateName/$countTemplateMatch > 2) ? 'procedural' : 'non-procedural';
	}
	fwrite($fProcedural, $filePath . ' ' . $procVSnonproc . "\n");
	
	
	// Close xml reader
	$reader->close();
}




/* --- PRINT RESULTS --- */
// Elements
//print_r($elements);
foreach ($elements as $element => $dataE)
{
	// count of element
	fwrite($fElements, $dataE[COUNT] . ' ' . $element . "\n");
	unset($dataE[COUNT]);
	foreach ($dataE as $attribute => $dataA)
	{
		// count of element with attribute
		fwrite($fElements, $dataA[COUNT] . ' ' . $element . '#' . $attribute . "\n");
		unset($dataA[COUNT]);
		foreach ($dataA as $value => $dataV)
		{
			// count of element with attribute with value
			fwrite($fElements, $dataV[COUNT] . ' ' . $element . '#' . $attribute . '#' . $value . "\n");
			unset($dataV[COUNT]);
		}
	}
}


// CLOSE FILES
fclose($fFiles);
fclose($fElements);
fclose($fDepth);
fclose($fXpath);
fclose($fVersion);
//fclose($fFanout);
fclose($fNesting);
fclose($fRecursion);
fclose($fOutput);
fclose($fProcedural);


?>