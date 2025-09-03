import SwiftUI

// MARK: - BadgeView
/// ------------------------------------------------------
///  Author: Meheboob Nadaf
///  Created On: 03-Sep-2025
///
///  Description:
///  A SwiftUI view that displays a circular red badge with
///  a count number inside it. The badge only appears if the
///  count is greater than 0.
///
///  Usage:
///     BadgeView(count: 5)
///
///  Notes:
///  - Commonly used for notification counts, cart items, etc.
///  - The circle is dynamically sized based on padding.
///  - If `count` is 0 or less, no view is rendered.
///
///  Time Complexity:
///  - O(1): Constant time since it only evaluates one `if`
///    condition and renders a small SwiftUI view.
///
///  Space Complexity:
///  - O(1): Uses fixed memory regardless of input count.
/// ------------------------------------------------------
struct BadgeView: View {
    
    // MARK: - Properties
    let count: Int   // Number to be displayed inside the badge
    
    // MARK: - Body
    var body: some View {
        if count > 0 {   // Show badge only if count is positive
            Text("\(count)")             // Display count as text
                .font(.caption2)          // Small font size
                .foregroundColor(.white)  // White text color
                .padding(6)               // Inner padding
                .background(Color.red)    // Red circular background
                .clipShape(Circle())      // Clip background into circle
        }
    }
}
