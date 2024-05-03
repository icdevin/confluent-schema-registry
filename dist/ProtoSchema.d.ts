/// <reference types="node" />
/// <reference types="node" />
import { Schema, ProtoOptions, ProtoConfluentSchema } from './@types';
import { Type } from 'protobufjs/light';
export default class ProtoSchema implements Schema {
    private namespace;
    constructor(schema: ProtoConfluentSchema, opts?: ProtoOptions);
    private getNestedNamespace;
    toBufferFromNestedType(payload: object, typeName?: string): Buffer;
    toBuffer(payload: object): Buffer;
    private encodeMessageIndexes;
    private putVarint;
    fromBuffer(buffer: Buffer): any;
    private lookupMessage;
    private readMessageIndexes;
    private parseVarint;
    private parseUvarint;
    isValid(_payload: object, _opts?: {
        errorHook: (path: Array<string>, value: any, type?: any) => void;
    }): boolean;
    validatePayloadAgainstSchema(schema: Type, payload: object, opts?: {
        errorHook: (path: Array<string>, value: any, type?: any) => void;
    }): boolean;
}
