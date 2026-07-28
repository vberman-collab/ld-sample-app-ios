//
//  ContextChanger.swift
//  LDSampleAppiOS
//
//  Created by Kevin Cochran on 9/23/25.
//

import SwiftUI
import Foundation
import LaunchDarkly

class ContextChanger {
    func getDeveloper() -> LDContext? {
        var contextUserBuilder = LDContextBuilder()
        contextUserBuilder.kind("user")
        contextUserBuilder.key("user-018e7bd4-ab96-782e-87b0-b1e32082b481")
        contextUserBuilder.trySetValue("name", .string("Miriam Wilson"))
        contextUserBuilder.trySetValue("language", .string("en"))
        contextUserBuilder.trySetValue("tier", .string("full"))
        contextUserBuilder.trySetValue("userId", .string("mwilson"))
        contextUserBuilder.trySetValue("role", .string("developer"))
        contextUserBuilder.trySetValue("email", .string("miriam.wilson@example.com"))
        
        var contextDeviceBuilder = LDContextBuilder()
        contextDeviceBuilder.kind("device")
        contextDeviceBuilder.key("device-018e7bd4-ab96-782e-87b0-b1e32082b481")
        contextDeviceBuilder.trySetValue("os", .string("macOS"))
        contextDeviceBuilder.trySetValue("osVersion", .string("15.6"))
        contextDeviceBuilder.trySetValue("model", .string("MacBook Pro"))
        contextDeviceBuilder.trySetValue("manufacturer", .string("Apple"))
        
        var contextBuilder = LDMultiContextBuilder()
        var context: LDContext
        
        do {
            contextBuilder.addContext(try contextUserBuilder.build().get())
            contextBuilder.addContext(try contextDeviceBuilder.build().get())
            context = try contextBuilder.build().get()
            return context
        } catch {
            return nil
        }
    }
    
    func setDeveloper() {
        let context = getDeveloper()
        let client = LDClient.get()!
        
        client.identify(context: context!) { result in
            // do nothing
        }
    }
    
    func getCustomer() -> LDContext? {
        var contextUserBuilder = LDContextBuilder()
        contextUserBuilder.kind("user")
        contextUserBuilder.key("user-e6ad2161-c300-4667-aeb3-e44173d6505a")
        contextUserBuilder.trySetValue("name", .string("Darren Jones"))
        contextUserBuilder.trySetValue("language", .string("en"))
        contextUserBuilder.trySetValue("tier", .string("standard"))
        contextUserBuilder.trySetValue("userId", .string("djones2554"))
        contextUserBuilder.trySetValue("role", .string("customer"))
        contextUserBuilder.trySetValue("email", .string("djones2554@coolmail.com"))
        
        var contextDeviceBuilder = LDContextBuilder()
        contextDeviceBuilder.kind("device")
        contextDeviceBuilder.key("device-e6ad2161-c300-4667-aeb3-e44173d6505a")
        contextDeviceBuilder.trySetValue("os", .string("iOS"))
        contextDeviceBuilder.trySetValue("osVersion", .string("16"))
        contextDeviceBuilder.trySetValue("model", .string("iPhone"))
        contextDeviceBuilder.trySetValue("manufacturer", .string("Apple"))
        
        var contextBuilder = LDMultiContextBuilder()
        var context: LDContext
        
        do {
            contextBuilder.addContext(try contextUserBuilder.build().get())
            contextBuilder.addContext(try contextDeviceBuilder.build().get())
            context = try contextBuilder.build().get()
            return context
        } catch {
            return nil
        }
    }
    
    func setCustomer() {
        let context = getCustomer()
        let client = LDClient.get()!
        
        client.identify(context: context!) { result in
            // do nothing
        }
    }
    
    func getEmployee() -> LDContext? {
        var contextUserBuilder = LDContextBuilder()
        contextUserBuilder.kind("user")
        contextUserBuilder.key("user-7cd24fc6-7758-4d73-8c14-52c09f2de044")
        contextUserBuilder.trySetValue("name", .string("Emily Harris"))
        contextUserBuilder.trySetValue("language", .string("en"))
        contextUserBuilder.trySetValue("tier", .string("premium"))
        contextUserBuilder.trySetValue("userId", .string("eharris"))
        contextUserBuilder.trySetValue("role", .string("employee"))
        contextUserBuilder.trySetValue("email", .string("emily.harris@example.com"))
        
        var contextDeviceBuilder = LDContextBuilder()
        contextDeviceBuilder.kind("device")
        contextDeviceBuilder.key("device-7cd24fc6-7758-4d73-8c14-52c09f2de044")
        contextDeviceBuilder.trySetValue("os", .string("macOS"))
        contextDeviceBuilder.trySetValue("osVersion", .string("15.6"))
        contextDeviceBuilder.trySetValue("model", .string("MacBook Pro"))
        contextDeviceBuilder.trySetValue("manufacturer", .string("Apple"))
        
        var contextBuilder = LDMultiContextBuilder()
        var context: LDContext
        
        do {
            contextBuilder.addContext(try contextUserBuilder.build().get())
            contextBuilder.addContext(try contextDeviceBuilder.build().get())
            context = try contextBuilder.build().get()
            return context
        } catch {
            return nil
        }
    }
    
    func setEmployee() {
        let context = getEmployee()
        let client = LDClient.get()!
        
        client.identify(context: context!) { result in
            // do nothing
        }
    }
    
    func getRandom() -> LDContext? {
        let newUUID = UUID()
        let contextBuilder = LDContextBuilder(key: "user-" + newUUID.uuidString)
        var context: LDContext
        
        do {
            context = try contextBuilder.build().get()
            return context
        } catch {
            return nil
        }
    }
    
    func setRandom() {
        let context = getRandom()
        var finalResult = false
        
        LDClient.get()!.identify(context: context!) { result in
            finalResult = true
            print(result)
        }
    }
}
