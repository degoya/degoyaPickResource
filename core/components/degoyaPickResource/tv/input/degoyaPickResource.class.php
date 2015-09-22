<?php
/*
 * degoyaPickResource custom TV - input setup
 *
 * @var modX $this->modx
 * @var modTemplateVar $this
 *
 */
class DegoyaPickResourceInputRender extends modTemplateVarInputRender {
    public function process($value,array $params = array()) {
        $this->modx->lexicon->load('degoyaPickResource');
        $this->setPlaceholder('btnCaptionDelete',$this->modx->lexicon('degoyaPickResource.btnCaptionDelete'));
        $this->setPlaceholder('btnCaptionChoose',$this->modx->lexicon('degoyaPickResource.btnCaptionChoose'));

        $rootid = !empty($params['parents']) ? $params['parents'] : 0;
        $context = !empty($params['context']) ? $params['context'] : 'true';
        $currentresource = $this->modx->getObject('modResource', $_GET[id]);
        $contextkey =  $currentresource->get('context_key');
        $contextParents = !empty($params['contextParents']) ? $params['contextParents'] : '0';
        if ($context==1) {
            $contextParent = array();
            function string_to_array($string, $element_delimiter = '||', $value_delimiter = '==') {
                $results = array();
                $array = explode($element_delimiter, $string);
                foreach ($array as $result) {
                    $element = explode($value_delimiter, $result);
                    $results[$element[0]] = $element[1];
                }
                return $results;
            }
            $contextParent = string_to_array($contextParents);
            $rootid = $contextParent[$contextkey];
            //$this->modx->log(modX::LOG_LEVEL_ERROR,'rootid '.$rootid);
        }

        
        $roottext = "";
        if ($rootid > 0) {
            // get pagetitle for id
            $page = $this->modx->getObject('modResource', $rootid);
            if (is_object($page)) $roottext = $page->get('pagetitle').' ('.$rootid.')';
            else $rootid = 0;   // resource rootid not found
        }

        $excludes = !empty($params['excludes']) ? implode("~",explode(',',$params['excludes'])) : "";
        $templates = !empty($params['templates']) ? implode("~",explode(',',$params['templates'])) : "0";
        $expanded = !empty($params['expanded']) ? $params['expanded'] : false;
        $publishedOnly = !empty($params['publishedOnly']) ? $params['publishedOnly'] : false;
        $rootVisible = !empty($params['rootVisible']) ? $params['rootVisible'] : '';
        $opts = array(
            "rootid" => $rootid,
            "roottext" => $roottext,
            "excludes" => $excludes,
            "expanded" => $expanded,
            "rootVisible" => $rootVisible,
            "publishedOnly" => $publishedOnly,
            "templates" => $templates,
            "context" => $context,
            "contextkey" => $contextkey,
            "contextParents" => $contextParents);
        $this->setPlaceholder('opts',json_encode($opts));

    }
    public function getTemplate() {
        $this->modx->lexicon->load('degoyaPickResource');
        return $this->modx->getOption('core_path',null,MODX_CORE_PATH).'components/degoyaPickResource/tv/input/tpl/degoyaPickResource.tpl';
    }
}
return 'DegoyaPickResourceInputRender';