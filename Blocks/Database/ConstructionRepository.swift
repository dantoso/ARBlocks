import CoreData

struct ConstructionRepository {
    let container: NSPersistentContainer
	var context: NSManagedObjectContext { container.viewContext }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Blocks")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
				// TODO: Throw custom error
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

	func getAllConstructions() -> [ConstructionData] {
		let request = CDConstruction.fetchRequest()
		guard let result = try? context.fetch(request) else { return [] }

		let constructions = result.map { data in
			return ConstructionData(construction: data)
		}

		return constructions
	}

	func saveConstruction(construction: ConstructionData) {
		let data = construction.exportConstruction()

		let object = CDConstruction(context: context)
		object.initialX = data.initialPosition.x
		object.initialY = data.initialPosition.y
		object.initialZ = data.initialPosition.z

		object.name = data.name
		let blocks = data.blocks.map { model in
			let block = CDBlock(context: context)
			block.x = model.position.x
			block.y = model.position.y
			block.z = model.position.z
			block.colorRawValue = model.color.rawValue

			return block
		}

		object.addToBlocks(NSSet(array: blocks))

		try? context.save()
	}
}
