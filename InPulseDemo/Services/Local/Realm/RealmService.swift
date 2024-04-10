//
//  RealmService.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Foundation
import RealmSwift
import BralyLogger

struct RealmService {

    // MARK: - Variables
    private var backgroundQueue = DispatchQueue(label: "realm.queue",
                                                qos: .background,
                                                target: nil)

}

private extension RealmService {
    func write(_ handler: @escaping ((_ realm: Realm) -> Void)) {
        do {
            let realm = try Realm()
            try realm.write {
                handler(realm)
            }
        } catch {
            Logger.e(messages: "Realm write failed with error: \(error)")
        }
    }

    func load<T: Object>(listOf: T.Type, filter: NSPredicate? = nil, sortKeyPath: String? = nil) -> [T] {
        do {
            var objects = try Realm().objects(T.self)
            if let filter = filter {
                objects = objects.filter(filter)
            }
            if let sortKeyPath = sortKeyPath {
                objects = objects.sorted(byKeyPath: sortKeyPath)
            }
            var list = [T]()
            for obj in objects {
                list.append(obj)
            }
            return list
        } catch {
            print(error)
        }
        return []
    }

    func load<T: Object>(ofType: T.Type, primaryKey: String) -> T? {
        do {
            let object = try Realm().object(ofType: T.self, forPrimaryKey: primaryKey)
            return object
        } catch {
            return nil
        }
    }

    func delete<T: Object>(listOf: T.Type, filter: NSPredicate? = nil) {
        do {
            let realm = try Realm()
            try realm.write({
                var objects = realm.objects(T.self)
                if let filter = filter {
                    objects = objects.filter(filter)
                }
                realm.delete(objects)
            })
        } catch {
            print(error)
        }
    }

    func removeAll() {
        write { realm in
            realm.deleteAll()
        }
    }
}
