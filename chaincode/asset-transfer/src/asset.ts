/*
  SPDX-License-Identifier: Apache-2.0
*/

import { prototype } from 'events';
import {Object, Property} from 'fabric-contract-api';

@Object()
export class Asset {
    @Property()
    public docType?: string;

    @Property()
    public ID: string;

    @Property()
    public Color: string;

    @Property()
    public Size: number;

    @Property()
    public Owner: string;

    @Property()
    public AppraisedValue: number;
}

@Object()
export class Order {
    @Property()
    public ID?: string;

    @Property()
    public From: string;

    @Property()
    public To: string;

    @Property()
    public Date: string;

    @Property()
    public Amount: number;

    @Property()
    public Payload: string;

    @Property()
    public ItemType?: string;
}
