<div id="tv-input-properties-form{$tv}"></div>
{literal}

<script type="text/javascript">
// <![CDATA[
var params = {
{/literal}{foreach from=$params key=k item=v name='p'}
 '{$k}': '{$v|escape:"javascript"}'{if NOT $smarty.foreach.p.last},{/if}
{/foreach}{literal}
};
var oc = {'change':{fn:function(){Ext.getCmp('modx-panel-tv').markDirty();},scope:this}};
MODx.load({
    xtype: 'panel'
    ,layout: 'form'
    ,autoHeight: true
    ,cls: 'form-with-labels'
    ,labelAlign: 'top'
    ,border: false
    ,items: [{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$degoyaPickResource.parentsTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaPickResource.parentsHelp}{literal}'
        ,name: 'inopt_parents'
        ,id: 'inopt_parents{/literal}{$tv}{literal}'
        ,value: params['parents'] || ''
        ,anchor: '100%'
        ,listeners: oc
    },{
        xtype: MODx.expandHelp ? 'label' : 'hidden'
        ,forId: 'inopt_parents{/literal}{$tv}{literal}'
        ,html: '{/literal}{$degoyaPickResource.parentsHelp}{literal}'
        ,cls: 'desc-under'
    },{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$degoyaPickResource.excludesTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaPickResource.excludesHelp}{literal}'
        ,name: 'inopt_excludes'
        ,id: 'inopt_excludes{/literal}{$tv}{literal}'
        ,value: params['excludes'] || ''
        ,anchor: '100%'
        ,listeners: oc
    },{
        xtype: MODx.expandHelp ? 'label' : 'hidden'
        ,forId: 'inopt_excludes{/literal}{$tv}{literal}'
        ,html: '{/literal}{$degoyaPickResource.excludesHelp}{literal}'
        ,cls: 'desc-under'
    },{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$degoyaPickResource.templatesTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaPickResource.templatesHelp}{literal}'
        ,name: 'inopt_templates'
        ,id: 'inopt_templates{/literal}{$tv}{literal}'
        ,value: params['templates'] || ''
        ,width: '99%'
        ,listeners: oc
    },{
        xtype: MODx.expandHelp ? 'label' : 'hidden'
        ,forId: 'inopt_templates{/literal}{$tv}{literal}'
        ,html: '{/literal}{$degoyaPickResource.templatesHelp}{literal}'
        ,cls: 'desc-under'
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$degoyaPickResource.expandedTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaPickResource.expandedHelp}{literal}'
        ,name: 'inopt_expanded'
        ,hiddenName: 'inopt_expanded'
        ,id: 'inopt_expanded{/literal}{$tv}{literal}'
        ,value: !(params['expanded'] == 0 || params['expanded'] == 'false')
        ,anchors: '98%'
        ,width: '99%'
        ,listeners: oc
    }, {
        xtype: MODx.expandHelp ? 'label' : 'hidden'
        ,forId: 'inopt_expanded{/literal}{$tv}{literal}'
        ,html: '{/literal}{$degoyaPickResource.expandedHelp}{literal}'
        ,cls: 'desc-under'
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$degoyaPickResource.rootVisibleTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaPickResource.rootVisibleHelp}{literal}'
        ,name: 'inopt_rootVisible'
        ,hiddenName: 'inopt_rootVisible'
        ,id: 'inopt_rootVisible{/literal}{$tv}{literal}'
        ,value: !(params['rootVisible'] == 0 || params['rootVisible'] == 'false')
        ,anchors: '98%'
        ,width: '99%'
        ,listeners: oc
    }, {
        xtype: MODx.expandHelp ? 'label' : 'hidden'
        ,forId: 'inopt_rootVisible{/literal}{$tv}{literal}'
        ,html: '{/literal}{$degoyaPickResource.rootVisibleHelp}{literal}'
        ,cls: 'desc-under'
    } ,{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$degoyaPickResource.publishedOnlyTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaPickResource.publishedOnlyHelp}{literal}'
        ,name: 'inopt_publishedOnly'
        ,hiddenName: 'inopt_publishedOnly'
        ,id: 'inopt_publishedOnly{/literal}{$tv}{literal}'
        ,value: !(params['publishedOnly'] == 0 || params['publishedOnly'] == 'false')
        ,anchors: '98%'
        ,width: '99%'
        ,listeners: oc
    }, {
        xtype: MODx.expandHelp ? 'label' : 'hidden'
        ,forId: 'inopt_publishedOnly{/literal}{$tv}{literal}'
        ,html: '{/literal}{$degoyaPickResource.publishedOnlyHelp}{literal}'
        ,cls: 'desc-under'
    },{
        xtype: 'combo-boolean'
        ,fieldLabel: '{/literal}{$degoyaPickResource.contextTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaPickResource.contextHelp}{literal}'
        ,name: 'inopt_context'
        ,hiddenName: 'inopt_context'
        ,id: 'inopt_context{/literal}{$tv}{literal}'
        ,value: !(params['context'] == 0 || params['context'] == 'false')
        ,width: '99%'
        ,listeners: oc
    },{
        xtype: MODx.expandHelp ? 'label' : 'hidden'
        ,forId: 'inopt_context{/literal}{$tv}{literal}'
        ,html: '{/literal}{$degoyaPickResource.contextHelp}{literal}'
        ,cls: 'desc-under'
    },{
        xtype: 'textfield'
        ,fieldLabel: '{/literal}{$degoyaPickResource.contextParentsTitle}{literal}'
        ,description: MODx.expandHelp ? '' : '{/literal}{$degoyaPickResource.contextParentsHelp}{literal}'
        ,name: 'inopt_contextParents'
        ,id: 'inopt_contextParents{/literal}{$tv}{literal}'
        ,value: params['contextParents'] || ''
        ,width: '99%'
        ,listeners: oc
    },{
        xtype: MODx.expandHelp ? 'label' : 'hidden'
        ,forId: 'inopt_contextParents{/literal}{$tv}{literal}'
        ,html: '{/literal}{$degoyaPickResource.contextParentsHelp}{literal}'
        ,cls: 'desc-under'
    }]
    ,renderTo: 'tv-input-properties-form{/literal}{$tv}{literal}'
});
// ]]>
</script>
{/literal}