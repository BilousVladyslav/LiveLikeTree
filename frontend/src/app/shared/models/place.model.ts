export class PlaceModel {
    id: string;
    number: string;
    is_busy: boolean;
}

export class GraveyardInfoModel {
    id: string;
    name: string;
    address: string;
}

export class PlaceInfoModel {
    id: string;
    number: string;
    location: GraveyardInfoModel;
    tree: string;
    tree_status: string;
}