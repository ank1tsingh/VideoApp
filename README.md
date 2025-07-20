# 📱 iOS Video App

A native iOS app that displays video content from a JSON API with hero carousel and video playback functionality.

## Approach & Structure

**Architecture**: MVVM with Repository and Use Case patterns
- **Data Layer**: Repository handles API calls via URLSession
- **Domain Layer**: Use Cases contain business logic 
- **Presentation Layer**: ViewModels + SwiftUI Views

**Key Components**:
- Hero banner with 4 random videos (auto-scrolling)
- Video list with thumbnails, metadata, and live indicators
- Video player using AVPlayer
- Comprehensive error handling with retry functionality

## Assumptions

- All video URLs from API are accessible
- Hero banner shows 4 random videos as specified
- Auto-scroll interval set to 3 seconds for good UX
- Portrait orientation optimized
- HTTP video URLs require ATS configuration

## Limitations & Trade-offs

**Limitations**:
- No offline caching or local storage
- No video quality selection
- No search or filtering capabilities
- Videos pause when app goes to background

**Trade-offs**:
- Used `async/await` over full Combine for simpler, modern code
- Chose `NSAllowsArbitraryLoads` for ATS (quick fix vs domain-specific config)
- Simple error handling over complex retry strategies
- Basic navigation over coordinator pattern for scope simplicity

## Tech Stack

- **Swift** + **SwiftUI** + **AVPlayer**
- **URLSession** with async/await for networking
- **MVVM** architecture with Repository pattern

## Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/ee8daf0e-3881-4eb8-b2e5-fb6c1b8cea05" alt="Screenshot 2" width="300"/>
  &nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/28d6075e-8cc7-4343-a546-b919db0d250b" alt="Screenshot 1" width="300"/>
  
</p>

---
