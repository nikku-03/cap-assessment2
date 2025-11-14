using ustnikitapandidatamodel from '../db/schema';

service Service {

    @UI.HeaderInfo:{

        TypeName:'{i18n>PURCHASE ORDER}',
        TypeNamePlural: '{i18n>Purchase Order}',
        Title:{Value:node_key},
        Description:{Value:PO_ID}
    }

    @UI.LineItem:[
        {Value:node_key, Label:'NODE KEY'},
        {Value:PO_ID, Label:'PURCHASE ORDER ID'},
        {Value:Partner_guid, Label:'PARTNER GUID'},
        {Value:currency, Label:'CURRENCY'},
        {Value:Gross_amount, Label:'GROSS AMOUNT'},
        {Value:net_amount, Label:'NET AMOUNT'},
        {Value:tax_amount, Label:'TAX AMOUNT'},
        {Value:lifecycle_status, Label:'LIFECYCLE STATUS'},
        {Value:overall_status, Label:'OVERALL STATUS'}

    ]

    @UI.Identification:[

        {Value:node_key, Label:'NODE KEY'},
        {Value:PO_ID, Label:'PURCHASE ORDER ID'},
        {Value:Partner_guid, Label:'PARTNER GUID'},
        {Value:currency, Label:'CURRENCY'},
        {Value:Gross_amount, Label:'GROSS AMOUNT'},
        {Value:net_amount, Label:'NET AMOUNT'},
        {Value:tax_amount, Label:'TAX AMOUNT'},
        {Value:lifecycle_status, Label:'LIFECYCLE STATUS'},
        {Value:overall_status, Label:'OVERALL STATUS'}

    ]

    @UI.SelectionFields:[PO_ID, Partner_guid,lifecycle_status,overall_status]

    @UI.Facets:[
        {$Type:'UI.ReferenceFacet', Label:'{i18n>PURCHASE ORDER}', Target:'@UI.Identification'},
        {$Type:'UI.ReferenceFacet', Label:'{i18n>PURCHASE ORDER}', Target:'po/@UI.LineItem'}
    ]


    entity PurchaseOrder as projection on ustnikitapandidatamodel.PurchaseOrder{

        key node_key,
        PO_ID,
        Partner_guid,
        currency,
        Gross_amount,
        net_amount,
        tax_amount,
        lifecycle_status,
        overall_status,
        po
    };


    @UI.HeaderInfo:{

        TypeName:'PURCHASE ORDER ITEM',
        TypeNamePlural: 'Purchase Order ITEM',
        Title:{Value:item_key},
        Description:{Value:product_guid},
    
    }

    @UI.LineItem:[

        {Value:item_key, Label:'ITEM KEY'},
        {Value:node_key, Label:'NODE KEY'},
        {Value:po_item_pos, Label:'PURCHASE ORDER ITEM '},
        {Value:product_guid, Label:'Product GUID'},
        {Value:currency, Label:'CURRENCY'},
        {Value:gross_amount, Label:'GROSS AMOUNT'},
        {Value:net_amount, Label:'NET AMOUNT'},
        {Value:tax_amount, Label:'TAX AMOUNT'},
    ]

    @UI.Identification:[

        {Value:item_key, Label:'ITEM KEY'},
        {Value:node_key, Label:'NODE KEY'},
        {Value:po_item_pos, Label:'PURCHASE ORDER ITEM '},
        {Value:product_guid, Label:'Product GUID'},
        {Value:currency, Label:'CURRENCY'},
        {Value:gross_amount, Label:'GROSS AMOUNT'},
        {Value:net_amount, Label:'NET AMOUNT'},
        {Value:tax_amount, Label:'TAX AMOUNT'}

    ]

    @UI.SelectionFields:[po_item_pos, product_guid]

    @UI.Facets:[
        {$Type:'UI.ReferenceFacet', Label:'{i18n>PURCHASE ORDER ITEM}', Target:'@UI.Identification'}
    ]


    entity PurchaseOrderItems as projection on ustnikitapandidatamodel.PurchaseOrderItems{

        key node_key,
        key item_key,
        po_item_pos,
        product_guid,
        currency,
        gross_amount,
        net_amount,
        tax_amount

    };
}