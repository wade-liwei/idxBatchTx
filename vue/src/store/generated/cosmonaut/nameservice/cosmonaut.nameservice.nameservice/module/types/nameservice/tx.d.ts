import { Reader, Writer } from "protobufjs/minimal";
export declare const protobufPackage = "cosmonaut.nameservice.nameservice";
export interface MsgBuyName {
    creator: string;
    index: number;
    md5: string[];
}
export interface MsgBuyNameResponse {
}
export declare const MsgBuyName: {
    encode(message: MsgBuyName, writer?: Writer): Writer;
    decode(input: Reader | Uint8Array, length?: number): MsgBuyName;
    fromJSON(object: any): MsgBuyName;
    toJSON(message: MsgBuyName): unknown;
    fromPartial(object: DeepPartial<MsgBuyName>): MsgBuyName;
};
export declare const MsgBuyNameResponse: {
    encode(_: MsgBuyNameResponse, writer?: Writer): Writer;
    decode(input: Reader | Uint8Array, length?: number): MsgBuyNameResponse;
    fromJSON(_: any): MsgBuyNameResponse;
    toJSON(_: MsgBuyNameResponse): unknown;
    fromPartial(_: DeepPartial<MsgBuyNameResponse>): MsgBuyNameResponse;
};
/** Msg defines the Msg service. */
export interface Msg {
    /** this line is used by starport scaffolding # proto/tx/rpc */
    BuyName(request: MsgBuyName): Promise<MsgBuyNameResponse>;
}
export declare class MsgClientImpl implements Msg {
    private readonly rpc;
    constructor(rpc: Rpc);
    BuyName(request: MsgBuyName): Promise<MsgBuyNameResponse>;
}
interface Rpc {
    request(service: string, method: string, data: Uint8Array): Promise<Uint8Array>;
}
declare type Builtin = Date | Function | Uint8Array | string | number | undefined;
export declare type DeepPartial<T> = T extends Builtin ? T : T extends Array<infer U> ? Array<DeepPartial<U>> : T extends ReadonlyArray<infer U> ? ReadonlyArray<DeepPartial<U>> : T extends {} ? {
    [K in keyof T]?: DeepPartial<T[K]>;
} : Partial<T>;
export {};
