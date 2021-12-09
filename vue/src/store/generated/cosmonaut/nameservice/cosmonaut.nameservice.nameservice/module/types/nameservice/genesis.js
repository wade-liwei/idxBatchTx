/* eslint-disable */
import * as Long from "long";
import { util, configure, Writer, Reader } from "protobufjs/minimal";
import { Whois } from "../nameservice/whois";
export const protobufPackage = "cosmonaut.nameservice.nameservice";
const baseGenesisState = { whoisCount: 0 };
export const GenesisState = {
    encode(message, writer = Writer.create()) {
        for (const v of message.whoisList) {
            Whois.encode(v, writer.uint32(10).fork()).ldelim();
        }
        if (message.whoisCount !== 0) {
            writer.uint32(16).uint64(message.whoisCount);
        }
        return writer;
    },
    decode(input, length) {
        const reader = input instanceof Uint8Array ? new Reader(input) : input;
        let end = length === undefined ? reader.len : reader.pos + length;
        const message = { ...baseGenesisState };
        message.whoisList = [];
        while (reader.pos < end) {
            const tag = reader.uint32();
            switch (tag >>> 3) {
                case 1:
                    message.whoisList.push(Whois.decode(reader, reader.uint32()));
                    break;
                case 2:
                    message.whoisCount = longToNumber(reader.uint64());
                    break;
                default:
                    reader.skipType(tag & 7);
                    break;
            }
        }
        return message;
    },
    fromJSON(object) {
        const message = { ...baseGenesisState };
        message.whoisList = [];
        if (object.whoisList !== undefined && object.whoisList !== null) {
            for (const e of object.whoisList) {
                message.whoisList.push(Whois.fromJSON(e));
            }
        }
        if (object.whoisCount !== undefined && object.whoisCount !== null) {
            message.whoisCount = Number(object.whoisCount);
        }
        else {
            message.whoisCount = 0;
        }
        return message;
    },
    toJSON(message) {
        const obj = {};
        if (message.whoisList) {
            obj.whoisList = message.whoisList.map((e) => e ? Whois.toJSON(e) : undefined);
        }
        else {
            obj.whoisList = [];
        }
        message.whoisCount !== undefined && (obj.whoisCount = message.whoisCount);
        return obj;
    },
    fromPartial(object) {
        const message = { ...baseGenesisState };
        message.whoisList = [];
        if (object.whoisList !== undefined && object.whoisList !== null) {
            for (const e of object.whoisList) {
                message.whoisList.push(Whois.fromPartial(e));
            }
        }
        if (object.whoisCount !== undefined && object.whoisCount !== null) {
            message.whoisCount = object.whoisCount;
        }
        else {
            message.whoisCount = 0;
        }
        return message;
    },
};
var globalThis = (() => {
    if (typeof globalThis !== "undefined")
        return globalThis;
    if (typeof self !== "undefined")
        return self;
    if (typeof window !== "undefined")
        return window;
    if (typeof global !== "undefined")
        return global;
    throw "Unable to locate global object";
})();
function longToNumber(long) {
    if (long.gt(Number.MAX_SAFE_INTEGER)) {
        throw new globalThis.Error("Value is larger than Number.MAX_SAFE_INTEGER");
    }
    return long.toNumber();
}
if (util.Long !== Long) {
    util.Long = Long;
    configure();
}
