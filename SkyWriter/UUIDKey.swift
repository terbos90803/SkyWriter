//
//  UUIDKey.swift
//  Basic Chat
//
//  Created by Trevor Beaton on 12/3/16.
//  Copyright © 2016 Vanguard Logic LLC. All rights reserved.
//

import CoreBluetooth

// Preset Selector
let kBLEService_UUID = "411acab3-23af-4a05-9bb7-35eaec0a7bb2"
let kBLE_Characteristic_uuid_Preset = "411acab3-23af-4a05-9bb7-35eaec0a7bb2"
let kBLE_Descriptor_uuid_Preset = "411acab3-23af-4a05-9bb7-35eaec0a7bb2"
let kBLE_Characteristic_uuid_numPresets = "4f504ffd-2db6-4b53-96cd-804988d27cda"

// Custom Message
let kBLE_Characteristic_uuid_customMsg = "7f4f6376-e0fa-45a3-ae89-47f162c30518"
let kBLE_Characteristic_uuid_customFG = "8e818756-e307-40b9-8217-f279bea0af1e"
let kBLE_Characteristic_uuid_customBG = "4c56472a-cd05-4aec-b9c5-9afa90c37ec9"
let kBLE_Descriptor_uuid_customMsg = "7f4f6376-e0fa-45a3-ae89-47f162c30518"
let MaxCharacters = 20

let BLEService_UUID = CBUUID(string: kBLEService_UUID)
let BLE_Characteristic_uuid_Preset = CBUUID(string: kBLE_Characteristic_uuid_Preset)//(Property = Read/Write)
let BLE_Descriptor_uuid_Preset = CBUUID(string: kBLE_Descriptor_uuid_Preset)//(Property = Read)
let BLE_Characteristic_uuid_numPresets = CBUUID(string: kBLE_Characteristic_uuid_numPresets)//(Property = Read)

let BLE_Characteristic_uuid_customMsg = CBUUID(string: kBLE_Characteristic_uuid_customMsg)//(Property = Read/Write)
let BLE_Characteristic_uuid_customFG = CBUUID(string: kBLE_Characteristic_uuid_customFG)//(Property = Read/Write)
let BLE_Characteristic_uuid_customBG = CBUUID(string: kBLE_Characteristic_uuid_customBG)//(Property = Read/Write)
let BLE_Descriptor_uuid_customMsg = CBUUID(string: kBLE_Descriptor_uuid_customMsg)//(Property = Read)
