//
//  ContentView.swift
//  Wellcore Beacon App
//
//  Created by Magme on 31/10/2021.
//

import Combine
import CoreLocation
import SwiftUI


// Beacon Detector Class

class BeaconDetector: NSObject, ObservableObject, CLLocationManagerDelegate{

    var locationManager: CLLocationManager?
    @Published var lastDistance = CLProximity.unknown
    
    override init(){
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self){
                if CLLocationManager.isRangingAvailable(){
                   startScanning()
                }
            }
        }
    }
    
    func startScanning(){
        let uuid = UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!
        let constraint = CLBeaconIdentityConstraint(uuid: uuid, major: 0000, minor: 0000)
        let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "My Beacon" )
        
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(satisfying: constraint)
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon =  beacons.first{
            update(distance: beacon.proximity)
        }else{
            update(distance: .unknown)
        }
    }
    
    func update(distance: CLProximity) {
        lastDistance = distance
    }
}

// Screens for

struct ContentView: View {
    
    @ObservedObject var detector = BeaconDetector()
    
    let gradinetOne = LinearGradient(gradient: Gradient(colors: [
        Color.purple,
        Color.red
    ]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing)
    
    
    let gradinetTwo = LinearGradient(gradient: Gradient(colors: [
        Color.blue,
        Color.orange
    ]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing)
    
    let gradinetThree = LinearGradient(gradient: Gradient(colors: [
        Color.blue,
        Color.purple
    ]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing)
    
    let gradinetFour = LinearGradient(gradient: Gradient(colors: [
        Color.green,
        Color.pink
    ]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing)
    
    
    var body: some View {
        
        if detector.lastDistance == .immediate {
            return ZStack{
                 gradinetOne.ignoresSafeArea()
                 VStack(alignment: .leading){
                     Text("Wellcore Beacon")
                         .font(.callout)
                         .multilineTextAlignment(.leading)
                         .padding()
                     Text("Very close")
                         .font(.largeTitle)
                         .bold()
                         .multilineTextAlignment(.leading)
                         .padding()
                     Text("Ad watch what will happens...")
                         .multilineTextAlignment(.leading)
                         .padding()
                     Text("There are four states of distance for beacon:")
                         .font(.headline)
                         .multilineTextAlignment(.leading)
                         .padding()
                     
                     Spacer()
                     HStack{
                     }
                 }
                 .foregroundColor(.white)
                 }
        }else if detector.lastDistance == .near {
            return ZStack{
                 gradinetTwo.ignoresSafeArea()
                 VStack(alignment: .leading){
                     Text("Wellcore Beacon")
                         .font(.callout)
                         .multilineTextAlignment(.leading)
                         .padding()
                     Text("Close")
                         .font(.largeTitle)
                         .bold()
                         .multilineTextAlignment(.leading)
                         .padding()
                     Text("Ad watch what will happens...")
                         .multilineTextAlignment(.leading)
                         .padding()
                     Text("There are four states of distance for beacon:")
                         .font(.headline)
                         .multilineTextAlignment(.leading)
                         .padding()
                     
                     Spacer()
                     HStack{
                     }
                 }
                 .foregroundColor(.white)
                 }
        }else if detector.lastDistance == .far {
            return ZStack{
                 gradinetThree.ignoresSafeArea()
                 VStack(alignment: .leading){
                     Text("Wellcore Beacon")
                         .font(.callout)
                         .multilineTextAlignment(.leading)
                         .padding()
                     Text("Near")
                         .font(.largeTitle)
                         .bold()
                         .multilineTextAlignment(.leading)
                         .padding()
                     Text("Ad watch what will happens...")
                         .multilineTextAlignment(.leading)
                         .padding()
                     Text("There are four states of distance for beacon:")
                         .font(.headline)
                         .multilineTextAlignment(.leading)
                         .padding()
                     
                     Spacer()
                     HStack{
                     }
                 }
                 .foregroundColor(.white)
                 }
        } else {
            
           return ZStack{
                gradinetFour.ignoresSafeArea()
                VStack(alignment: .leading){
                    Text("Wellcore Beacon")
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .padding()
                    Text("Far away")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .padding()
                    Text("Ad watch what will happens...")
                        .multilineTextAlignment(.leading)
                        .padding()
                    Text("There are four states of distance for beacon:")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Spacer()
                    HStack{
                    }
                }
                .foregroundColor(.white)
                }
        }
        
       
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
