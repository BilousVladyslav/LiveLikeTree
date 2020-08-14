export class PlaceInfo {
    number: string;
    tree: string;
}

export class CreateOrderModel {
    graveyard: string;
    places: PlaceInfo[];
}

export class OrderInfoModel{
    id: string;
    graveyard: string;
    places: PlaceInfo[];
    to_pay: number;
    created: string;
    status: string;
}

export class ManageOrderModel{
    id: string;
    to_pay: number;
    status: string;
}


