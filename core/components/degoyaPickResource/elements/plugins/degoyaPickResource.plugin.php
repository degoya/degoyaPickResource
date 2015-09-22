<?php
/*
 * Handles plugin events for degoyaPickResource custom TV
 *
 * @package degoyaPickResource
 *
 */
$corePath = $modx->getOption('core_path',null,MODX_CORE_PATH).'components/degoyaPickResource/';
$modx->lexicon->load('degoyaPickResource:default');
switch ($modx->event->name) {
    case 'OnTVInputRenderList':
        $modx->controller->addLexiconTopic('degoyaPickResource:default');
        $modx->event->output($corePath.'tv/input/');
        break;
    case 'OnTVOutputRenderList':
        $modx->event->output($corePath.'tv/output/');
        break;
    case 'OnTVInputPropertiesList':
        $modx->event->output($corePath.'tv/inputoptions/');
        break;
    case 'OnTVOutputRenderPropertiesList':
        $modx->event->output($corePath.'tv/properties/');
        break;
}