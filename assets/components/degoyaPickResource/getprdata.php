<?php
/**
 * Controller for degoyaPickResource Ajax requests.
 */
// Adjust the path appropriately
$docroot = dirname(dirname(dirname(dirname(__FILE__))));
include $docroot . '/config.core.php';
if (!defined('MODX_API_MODE')) {
    define('MODX_API_MODE', false);
}
include_once MODX_CORE_PATH . 'model/modx/modx.class.php';

$modx = new modX();
$modx->initialize('mgr');

if (!$modx->hasPermission('view_document')) {
    header('HTTP/1.0 401 Unauthorized');
    print 'Operation not allowed.';
    exit;
}

$root = (int) $modx->getOption('node',$_GET,0);
$expanded = $modx->getOption('expanded',$_GET,false);
if ($expanded=='true') {$expanded = true;}
$excludes = $modx->getOption('excludes',$_GET,"");
$excludes = (!empty($excludes) ? explode("~",$excludes) : array());
$templates = $modx->getOption('templates',$_GET,"");
$templates = (!empty($templates) ? explode("~",$templates) : array());
$publishedOnly = $modx->getOption('publishedOnly',$_GET,'');
$context = $modx->getOption('context',$_GET,'');
$contextkey = $modx->getOption('contextkey',$_GET,'');
$contextParents = (!empty($contextParents) ? explode("~",$contextParents) : array());
$resources = $modx->getCollection('modResource', array('parent' => $root));


$opts = array();
foreach ($resources as $resource) {
    $id = $resource->get('id');
    // excludes check
    if (in_array($id,$excludes)) continue;

    // published check
    if (!empty($publishedOnly) && ($publishedOnly == 1 || $publishedOnly == 'true')) {
        if (!$resource->get('published')) continue;
    }
    // Template check
    if ($templates.length != 0 || $templates[0] != 0 || $templates[0] != '' ) {
        if (!in_array($resource->get('template'),$templates)==1) {
            continue;
        }
    }
    // Context check
    if (!empty($context) && ($context == 1 || $context == 'true')) {
        if ($resource->get('context_key')!=$contextkey) continue;
    }
    $children = $modx->getChildIds($id,1,array('context' => $resource->get('context_key')));
    $text = $resource->get('pagetitle').' ('.$id.')';
    // Check for an icon class on the resource template
    $tplIcon = $resource->Template ? $resource->Template->icon : '';

    // Assign an icon class based on the class_key
    $classKey = strtolower($resource->get('class_key'));
    if (substr($classKey, 0, 3) == 'mod') {
        $classKey = substr($classKey, 3);
    }

    $classKeyIcon = $modx->getOption('mgr_tree_icon_' . $classKey, null, 'tree-resource', true);

    if (!empty($tplIcon)) {
        $iconCls[] = $tplIcon;
    } else {
        $iconCls[] = $classKeyIcon;
    }

    if (count($children) > 0) {
        if (empty($tplIcon) && $classKeyIcon == 'tree-resource') {
            $iconCls[] = $modx->getOption('mgr_tree_icon_folder', null, 'tree-folder');
        }
        $iconCls[] = 'parent-resource';
        $opts[] = array(
            'text' => $text,
            'id' => $id,
            'cls' => 'folder',
            'expanded' => $expanded,
            'iconCls' => implode(' ',$iconCls)
        );
    }
    else {
        $opts[] = array(
            'text' => $text,
            'id' => $id,
            'leaf' => true,
            'cls' => 'file',
            'iconCls' => implode(' ',$iconCls)
        );
    }
}

echo $modx->toJSON($opts);

@session_write_close();
exit();