import Foundation
import CoreData

extension CDConstruction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDConstruction> {
        return NSFetchRequest<CDConstruction>(entityName: "CDConstruction")
    }

    @NSManaged public var name: String?
    @NSManaged public var initialX: Float
    @NSManaged public var initialY: Float
    @NSManaged public var initialZ: Float
    @NSManaged public var blocks: Set<CDBlock>?

}

// MARK: Generated accessors for blocks
extension CDConstruction {

    @objc(addBlocksObject:)
    @NSManaged public func addToBlocks(_ value: CDBlock)

    @objc(removeBlocksObject:)
    @NSManaged public func removeFromBlocks(_ value: CDBlock)

    @objc(addBlocks:)
    @NSManaged public func addToBlocks(_ values: NSSet)

    @objc(removeBlocks:)
    @NSManaged public func removeFromBlocks(_ values: NSSet)

}

extension CDConstruction : Identifiable {

}
