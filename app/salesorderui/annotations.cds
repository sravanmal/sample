using CatalogService as service from '../../srv/Catalogservice';

annotate service.salesorder with @(

    UI.SelectionFields      : [
        sapSalesOrderNumber,
        documentDate,
        requestedDeliveryDate,
        soldToParty,

    ],

    UI.LineItem             : [
        {
            $Type: 'UI.DataField',
            Value: sapSalesOrderNumber,
            Label: 'Sales Order NO'
        },
        {
            $Type: 'UI.DataField',
            Value: salesOrganization,
            Label: 'Sales ORG'
        },
        {
            $Type: 'UI.DataField',
            Value: salesOffice,
            Label: 'Sales Office'
        },
        {
            $Type: 'UI.DataField',
            Value: requestedDeliveryDate,
            Label: 'Requested Delivery Date'
        },
        {
            $Type: 'UI.DataField',
            Value: paymentTerms,
            Label: 'Payment Terms'
        },
        {
            $Type: 'UI.DataField',
            Value: incoterms,
            Label: 'Incoterms'
        },
        {
            $Type: 'UI.DataField',
            Value: Status_Code,
            Label: 'Status',
            Criticality : ColorCode
        },
    ],

    UI.HeaderInfo           : {
        TypeName      : 'Sales Order',
        TypeNamePlural: 'Sales Orders',
        Title         : {Value: sapSalesOrderNumber},
        Description   : {Value: soldToParty}
    },

    UI.Facets               : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'General Information',
            Facets: [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Sales Order Details',
                    Target: '@UI.Identification'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Customer Details',
                    Target: '@UI.FieldGroup#Spiderman'
                },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'SO Items',
            Target: 'items/@UI.LineItem',
        },
    ],


    UI.Identification       : [
        {
            $Type: 'UI.DataField',
            Value: sapSalesOrderNumber,
            Label: 'Sales Order NO'
        },
        {
            $Type: 'UI.DataField',
            Value: salesOrganization,
            Label: 'Sales ORG'
        },
        {
            $Type: 'UI.DataField',
            Value: distributionChannel,
            Label: 'Distribution Channel'
        },
        {
            $Type: 'UI.DataField',
            Value: division,
            Label: 'Division'
        },
        {
            $Type: 'UI.DataField',
            Value: salesOffice,
            Label: 'Sales Office'
        },
        {
            $Type: 'UI.DataField',
            Value: salesGroup,
            Label: 'Sales Group'
        },
        {
            $Type: 'UI.DataField',
            Value: requestedDeliveryDate,
            Label: 'Requested Delivery Date'
        },
        {
            $Type: 'UI.DataField',
            Value: totalAmount,
            Label: 'Amount'
        },
        {
            $Type: 'UI.DataField',
            Value: currency_code,
            Label: 'Currency'
        },
        {
            $Type: 'UI.DataField',
            Value: Status_Code,
            Label: 'Status',
            Criticality : ColorCode
        },
    ],

    UI.FieldGroup #Spiderman: {
        Label: 'Details',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: soldToParty,
                Label: 'Customer Name'
            },
            {
                $Type: 'UI.DataField',
                Value: shipToParty,
                Label: 'Ship To Party'
            },
            {
                $Type: 'UI.DataField',
                Value: soldToParty,
                Label: 'Sold To Party'
            },
            {
                $Type: 'UI.DataField',
                Value: payer,
                Label: 'Payer'
            },

            {
                $Type: 'UI.DataField',
                Value: createdBy,
                Label: 'Created By'
            },
            {
                $Type: 'UI.DataField',
                Value: 'CreatedAt',
                Label: 'Created At'
            }

        ],
    }
);

annotate CatalogService.SalesOrderItems with @(

    UI.LineItem      : [
        {
            $Type: 'UI.DataField',
            Value: itemNumber,
            Label : 'Item Number'
        },
        {
            $Type: 'UI.DataField',
            Value: materialNumber,
            Label : 'Material Number'
        },
        {
            $Type: 'UI.DataField',
            Value: description,
            Label : 'Description'
        },
        {
            $Type: 'UI.DataField',
            Value: orderQuantity,
            Label : 'Order Quantity'
        },
        {
            $Type: 'UI.DataField',
            Value: plant,
            Label : 'Plant'
        },
        {
            $Type: 'UI.DataField',
            Value: itemCategory,
            Label : 'Item Category'
        },
        {
            $Type: 'UI.DataField',
            Value: currency_code,
            Label : 'Currency'
        },
        {
            $Type: 'UI.DataField',
            Value: plant,
            Label : 'Plant'
        },
        {
            $Type: 'UI.DataField',
            Value: unitPrice,
            Label : 'Unit price'
        },
        {
            $Type: 'UI.DataField',
            Value: unitOfMeasure,
            Label : 'Unit of Measure'
        },
        {
            $Type: 'UI.DataField',
            Value: discount,
            Label : 'Discount'
        },
        {
            $Type: 'UI.DataField',
            Value: tax,
            Label : 'Tax'
        },
        {
            $Type: 'UI.DataField',
            Value: totalPrice,
            Label : 'Total Price'
        },
    ],


    UI.HeaderInfo    : {
        TypeName      : 'SO Item',
        TypeNamePlural: 'SO Items',
        Title         : {Value: itemNumber},
        Description   : {Value: description}
    },

    UI.Facets        : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Item Info',
        Target: '@UI.Identification',
    }, ],

    UI.Identification: [
        {
            $Type: 'UI.DataField',
            Value: itemNumber,
            Label : 'Item Number'
        },
        {
            $Type: 'UI.DataField',
            Value: materialNumber,
            Label : 'Material Number'
        },
        {
            $Type: 'UI.DataField',
            Value: description,
            Label : 'Description'
        },
        {
            $Type: 'UI.DataField',
            Value: orderQuantity,
            Label : 'Order Quantity'
        },
        {
            $Type: 'UI.DataField',
            Value: unitOfMeasure,
            Label : 'Unit of Measure'
        },
        {
            $Type: 'UI.DataField',
            Value: plant,
            Label : 'Plant'
        },
        {
            $Type: 'UI.DataField',
            Value: itemCategory,
            Label : 'Item Category'
        },
        {
            $Type: 'UI.DataField',
            Value: currency_code,
            Label : 'Currency'
        },
        {
            $Type: 'UI.DataField',
            Value: plant,
            Label : 'Plant'
        },
        {
            $Type: 'UI.DataField',
            Value: unitPrice,
            Label : 'Unit price'
        },
        {
            $Type: 'UI.DataField',
            Value: discount,
            Label : 'Discount'
        },
        {
            $Type: 'UI.DataField',
            Value: tax,
            Label : 'Tax'
        },
        {
            $Type: 'UI.DataField',
            Value: totalPrice,
            Label : 'Total Price Item'
        },
    ]


)
