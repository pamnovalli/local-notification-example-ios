//
//  NotificationCenter.swift
//  localNotificationExample
//
//  Created by Pamela Ianovalli on 08/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UserNotifications


class NotificationCenter: NSObject, UNUserNotificationCenterDelegate {
    
    // Gerência as notificações
    let notificationCenter = UNUserNotificationCenter.current()
    
    func notificationRequest(){
        
        // Cria um array com todas as opções de notificação
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        // Solicita ao usuário a permissão para enviar notificação
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, erro) in
            print("User has declined notifications")
        }
        
    }
    
    //   Permite enviar uma notificação com o app em primeiro plano
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
    
    
    // Cria uma solicitação de notificação
    
    func scheduleNotification(notificationType: String) {
        
        // Cria o conteúdo personalizado da notificação
        
        let content = UNMutableNotificationContent()
        let categoryIdentifier = "Notification Type"
        
        content.title = notificationType
        content.body = "This is a local notification"
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = categoryIdentifier
        
        // Cria um trigger para o envio da notificação
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
        let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        //  Adiciona a notificação no NotificationCenter
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
    }
}
