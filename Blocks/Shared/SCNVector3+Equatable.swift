import SceneKit

/// This is technical, here I am conforming SCNVector3 to the Hasbale protocol
extension SCNVector3: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(x)
		hasher.combine(y)
		hasher.combine(z)
	}
	
	public static func == (lhs: SCNVector3, rhs: SCNVector3) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
	}
}
