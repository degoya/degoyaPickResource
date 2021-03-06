<input id="tv{$tv->id}" name="tv{$tv->id}"
    type="text" class="textfield"
    value="{$tv->get('value')|escape}"
    tvtype="{$tv->type}"
    readonly
/>
<a class="x-form-field-link x-form-field" href="javascript:void(0);" id="tv{$tv->id}_choose" name="tv{$tv->id}_choose" >{$btnCaptionChoose}</a>
<a class="x-form-field-link x-form-field" href="javascript:void(0);" id="tv{$tv->id}_delete" name="tv{$tv->id}_delete" >{$btnCaptionDelete}</a>
<script type="text/javascript">
// <![CDATA[
{literal}
Ext.onReady(function() {
    {/literal}
    var prwin{$tv->id};
    var propts{$tv->id} = {$opts};
    {literal}
    var fld1 = MODx.load({
    {/literal}
        xtype: 'textfield'
        ,applyTo: 'tv{$tv->id}'
        ,width: '99%'
        ,enableKeyEvents: true
        ,msgTarget: 'under'
        ,allowBlank: true
    {literal}
        ,listeners: { 'keydown': { fn:MODx.fireResourceFormChange, scope:this}}
    });
    Ext.getCmp('modx-panel-resource').getForm().add(fld1);
    MODx.makeDroppable(fld1);

    var lsctr = fld1.container.dom.children[1];
    lsctr.style.display = "inline-block";
    lsctr.style.width = "70%";

    var fld2 = Ext.get({/literal}'tv{$tv->id}_delete'{literal});
    if (fld2) {
        fld2.on('click',function(e,cb) {
            var prele = document.getElementById({/literal}'tv{$tv->id}'{literal});
            prele.value = "";
        });
    }
    var fld3 = Ext.get({/literal}'tv{$tv->id}_choose'{literal});
    if (fld3) {
        fld3.on('click',function(e,cb) {
            // create the window on the first click and reuse on subsequent clicks
            if (!prwin{/literal}{$tv->id}{literal}) {
                prwin{/literal}{$tv->id}{literal} = new Ext.Window({
                    {/literal}
                    title:  _('degoyaPickResource.winTitle'),
                    layout: 'fit',
                    width: 500,
                    height: 300,
                    closeAction: 'hide',
                    plain: true,
                    bodyBorder: false,
                    html: '<div id="tv{$tv->id}win" class="x-hidden"></div>',
                    {literal}
                    items: [{
                        xtype: 'treepanel',
                        useArrows: true,
                        autoScroll: true,
                        animate: true,
                        enableDD: false,
                        containerScroll: true,
                        border: false,
                        collapsible: false,
                        {/literal}
                        // auto create TreeLoader
                        dataUrl: '../assets/components/degoyaPickResource/getprdata.php',
                        requestMethod: 'GET',
                        root: {
                            nodeType: 'async',
                            text: propts{$tv->id}.roottext,
                            draggable: false,
                            expanded: true,
                            expandable : true,
                            id: propts{$tv->id}.rootid
                        },
                        rootVisible: propts{$tv->id}.rootVisible,
                        listeners: {
                            beforeload: function(treeLoader) {
                                this.loader.baseParams.excludes = propts{$tv->id}.excludes;
                                this.loader.baseParams.templates = propts{$tv->id}.templates;
                                this.loader.baseParams.expanded = propts{$tv->id}.expanded;
                                this.loader.baseParams.rootVisible = propts{$tv->id}.rootVisible;
                                this.loader.baseParams.publishedOnly = propts{$tv->id}.publishedOnly;
                                this.loader.baseParams.context = propts{$tv->id}.context;
                                this.loader.baseParams.contextkey = propts{$tv->id}.contextkey;
                                this.loader.baseParams.contextParents = propts{$tv->id}.contextParents;
                            },
                            click: function(n) {
                                var prele = document.getElementById("tv{$tv->id}");
                                prele.value = n.attributes.text;
                                prwin{$tv->id}.hide(this);
                            }
                        }
                        {literal}
                    }]
                });
            }
            prwin{/literal}{$tv->id}{literal}.show(this);
        });
    }
});
{/literal}
// ]]>
</script>