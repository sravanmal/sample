using { ust.myapp as my } from '../db/schema';


service CatalogService @(path: 'CatalogS'){

    entity salesorder @(odata.draft.enabled: true) as projection on my.SalesOrders{
        *,
        case status
            
            when 'N' then 'Saved'
            when 'C' then 'Confirmed'
            when 'D' then 'Delivered'
            when 'X' then 'Rejected'
            end as Status_Code : String(10),
        case status
            when 'N' then 2
            when 'C' then 3
            when 'D' then 3
            when 'X' then 1
            end as ColorCode : Integer,
    };

    // entity customer_salesarea as projection on my.customer_salesarea;

}