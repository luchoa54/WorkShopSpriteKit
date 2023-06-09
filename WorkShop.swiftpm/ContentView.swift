import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var body: some View {
        SpriteView(scene: GameController.shared.initialScene)
            .statusBarHidden(true)
            .ignoresSafeArea()
    }
}
