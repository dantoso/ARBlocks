import Foundation
import CoreData

/// Representation of a block in the database
extension CDBlock {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBlock> {
        return NSFetchRequest<CDBlock>(entityName: "CDBlock")
    }

    @NSManaged public var x: Float
    @NSManaged public var y: Float
    @NSManaged public var z: Float
    @NSManaged public var colorRawValue: String?
    @NSManaged public var building: CDConstruction?

}

extension CDBlock : Identifiable {

}
