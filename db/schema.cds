namespace ustnikitapandidatamodel ;

entity PurchaseOrder{

    Key node_key: UUID;
    PO_ID: UUID;
    Partner_guid: String;
    currency: String;
    Gross_amount: Decimal(9, 2);
    net_amount: Integer;
    tax_amount: Decimal(9,2);
    lifecycle_status: String;
    overall_status: String;

    po: Association to many PurchaseOrderItems on po.node_key = $self.node_key;


}

entity PurchaseOrderItems{

    key item_key: UUID;
    key node_key: UUID;
    po_item_pos: Integer;
    product_guid: String;
    currency: String;
    gross_amount: Decimal(9, 2);
    net_amount: Integer;
    tax_amount: Decimal(9,2);
}


