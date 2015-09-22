<?php
/*
 * degoyaPickResource custom TV - Input Options
 */
$corePath = $modx->getOption('degoyaPickResource.core_path', null, $modx->getOption('core_path').'components/degoyaPickResource/');
$lang = $modx->lexicon->fetch('degoyaPickResource.', true);
$modx->controller->setPlaceholder('degoyaPickResource', $lang);
return $modx->smarty->fetch($corePath.'tv/inputoptions/tpl/degoyaPickResource.tpl');