# 📸 Flickr iOS Application

### **A dynamic and accessible image search app powered by SwiftUI & MVVM.**  

This iOS application allows users to **search Flickr images dynamically**, view detailed metadata, and share images. It ensures a **smooth, accessible, and user-friendly experience** with optimized performance and modern UI.

---

## 🚀 Features Implemented  

### 🔍 **Search Functionality**  
- Supports **single-word searches** (e.g., "sunset") and **multi-tag searches** (e.g., "ocean, mountains").  
- **Real-time search updates** after every keystroke.  
- Shows **loading indicator** during API calls without blocking UI.  
- Restores **default images** when the search bar is cleared.  

### 🖼 **Image Grid View**  
- Uses `LazyVGrid` to efficiently display **image thumbnails**.  
- **Asynchronous image loading** prevents UI freezing.  
- **Fallback placeholder** displayed when images fail to load.  
- **Smooth transition animation** when navigating to the detail screen.  

### 📌 **Image Detail Screen**  
- Displays **full-sized image** with a consistent layout.  
- Shows **title, author, published date, and image size**.  
- Uses **formatted date** to enhance readability.  
- **Multiline support** ensures long titles do not get cut off.  
- Provides a **metadata section with fixed height** for uniform UI.  

### 🔄 **User Interactions**  
- **Upload and share images/videos** directly from the app.  
- **Share functionality** allows users to share image details and metadata.  
- **Animated navigation transition** between screens for a better experience.  

### 🌍 **Accessibility & Dynamic Text**  
- **VoiceOver support** ensures key elements are accessible.  
- `.accessibilityLabel` and `.accessibilityElement(children: .combine)` improve readability.  
- **Dynamic text scaling** using `.dynamicTypeSize()` ensures readability at different font sizes.  

### 📱 **UI & Performance Enhancements**  
- **Dark Mode support** for improved readability.  
- **Landscape mode support** with a responsive layout.  
- **Debounced search input** to prevent excessive API calls.  
- **Concurrency optimizations** using `TaskGroup` to fetch multiple tags in parallel.  
- **Error handling** for API failures, invalid searches, and no internet connection.  

---
- **App Interface**
- **Detailed View Example**
- **Share Feature in Action**

## 📸 **Screenshots & Video Demonstration**  
<p align="center">
    <img src="https://github.com/user-attachments/assets/32328e2a-7849-40fb-9d73-2717e4945af9" width="30%" />
    <img src="https://github.com/user-attachments/assets/fa1eb0df-a8ae-4f7e-ac98-620b8bfd0809" width="30%" />
    <img src="https://github.com/user-attachments/assets/6667d736-87ce-4582-87c7-1a9dd8c77ed8" width="30%" />
</p>
  
- **Search Functionality in Action**
  
https://github.com/user-attachments/assets/0600056a-3850-4241-b9e7-0889c8b97b75
  
---

## 🏗 **Tech Stack & Architecture**  
- **SwiftUI** – Modern UI framework for declarative UI.  
- **MVVM Architecture** – Ensures clean code separation.  
- **Combine Framework** – Handles debounced state management.  
- **Concurrency (`async/await`)** – Optimized network calls.  
- **Edifecs & DB2** – Used for **data validation & processing**.  

---

## ✅ **Testing & Code Coverage**  

### 🔹 **Unit Tests (`XCTest`)**  
- **Search Functionality**  
  - Typing a word updates results dynamically.  
  - Multiple search tags return correct images.  
  - Empty search restores default images.  
- **Metadata Extraction**  
  - Extracts **image size** from descriptions correctly.  
  - Formats the **published date** properly.  
- **Error Handling**  
  - Simulates **API failures and network issues**.  
  - Ensures invalid search terms return an empty result.  

### 🔹 **UI Tests**  
- **Grid & Detail Views**  
  - Verifies **image grid renders correctly**.  
  - Checks if **tapping an image opens the detail screen**.  
- **Share Functionality**  
  - Ensures **Share button exists & functions correctly**.  
- **Dynamic Text & Accessibility**  
  - Confirms **text scaling works with system settings**.  
  - Verifies **VoiceOver reads metadata properly**.  

---

## 📌 **How to Run the Project**  
1. **Clone the repository**  
   ```sh
   git clone https://github.com/your-username/FlickrApp.git  
   cd FlickrApp  
   ```  
2. **Open in Xcode**  
   - Requires **Xcode 15 or later**.  
   - Open `CVSFlickrApplication.xcodeproj`.  
3. **Run the app**  
   - Select **iPhone 14 Pro simulator**.  
   - Press `Cmd + R` or click **Run**.  
4. **Run Tests**  
   - Press `Cmd + U` to execute unit & UI tests.  

---

## 🎯 **Future Improvements**  
- **Infinite Scrolling** – Load more images dynamically.  
- **Favorites System** – Allow users to save images.  
- **Localization** – Add support for multiple languages.  
- **Better Image Caching** – Improve performance with disk caching.  

---

## 📩 **Contact & Contributions**  
👤 **Developer:** Muralidhar Reddy Kakanuru  
📧 Email: **mdk6314reddy@gmail.com**  
📌 Feel free to open issues & submit pull requests! 🚀

