namespace ust.myapp;

using {
    cuid,
    managed,
    temporal,
    Currency,
    Country
} from '@sap/cds/common';
// using { SAP_ICSM_BusinessPartnerExt as BP } from '../srv/external/SAP_ICSM_BusinessPartnerExt';



entity SalesOrders : cuid, managed {
    sapSalesOrderNumber   : String(20)            @readonly; // VBAK-VBELN
    documentType          : String(4); // VBAK-AUART
    salesOrganization     : String(4); // VBAK-VKORG
    distributionChannel   : String(2); // VBAK-VTWEG
    division              : String(2); // VBAK-SPART
    salesOffice           : String(4)             @readonly; // VBAK-VKBU
    salesGroup            : String(4)             @readonly; // VBAK-VKGRP
    documentDate          : Date; // VBAK-AUDAT
    requestedDeliveryDate : Date; // VBAK-VDATU
    paymentTerms          : String(10)            @readonly; // VBAK-ZTERM
    shippingConditions    : String(4)             @readonly; // VBAK-VSBED
    incoterms             : String(10)            @readonly; // VBAK-INCO1
    orderReason           : String(20)            @readonly; // VBAK-AUGRU

    // Partner Functions (linked to Customers)
    soldToParty           : String(20);
    shipToParty           : String(20);
    billToParty           : String(20);
    payer                 : String(20);

    totalAmount           : Decimal(13, 2) @readonly; // from VBAP-NETWR
    currency              : Currency; // VBAK-WAERK

    status                : String(1) default 'N' @readonly; // NEW, CONFIRMED, DELIVERED

    items                 : Composition of many SalesOrderItems
                                on items.salesOrder = $self;
}

entity SalesOrderItems : cuid {
    salesOrder     : Association to SalesOrders;
    itemNumber     : Integer        @readonly; // VBAP-POSNR
    materialNumber : String(40); // VBAP-MATNR
    description    : String(100); // VBAP-ARKTX
    orderQuantity  : Integer; // VBAP-KWMENG
    unitOfMeasure  : String(3)      @readonly; // VBAP-MEINS (e.g., 'PC', 'KG')
    plant          : String(4)      @readonly; // VBAP-WERKS
    itemCategory   : String(4)      @readonly; // VBAP-PSTYV
    currency       : Currency;

    // Pricing
    unitPrice      : Decimal(10, 2) @readonly; // VBAP-NETPR
    discount       : Decimal(10, 2) @readonly; // from conditions
    tax            : Decimal(10, 2) @readonly; // from conditions
    totalPrice     : Decimal(13, 2) @readonly; // VBAP-NETWR
}


// entity customer_salesarea as
//     projection on BP.A_CustomerSalesArea {

//         Customer as CustomerID,
//         SalesOrganization as Salesorg,
//         DistributionChannel as distributionChannel,
//         Division as division,
//         SalesGroup as salesgrp,
//         SalesOffice as salesofc
        
//     };
