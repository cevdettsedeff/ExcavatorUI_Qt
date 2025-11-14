# ExcavatorUI - Qt6

Modern excavator visualization and control interface built with Qt6 and QtQuick3D.

## 🚀 Features

- **Real-time 3D Visualization**: Multiple camera views of excavator operations
- **Qt6 & QtQuick3D**: Modern graphics using the latest Qt technologies
- **GLB 3D Models**: Optimized 3D models in GLB format
- **Clean Architecture**: Well-organized codebase with clear separation of concerns
- **Animated Controls**: Smooth animations for excavator arm movements
- **Database Integration**: Historical position tracking with SQLite

## 📁 Project Structure

```
ExcavatorUI_Qt/
├── src/
│   ├── main.cpp                    # Application entry point
│   └── qml/
│       ├── main.qml                # Main application window
│       ├── components/
│       │   ├── ui/                 # UI components
│       │   └── 3d/                 # 3D components
│       ├── scenes/                 # 3D Scenes
│       └── utils/                  # Utility components
├── resources/
│   ├── models/excavator/          # GLB 3D models
│   ├── shaders/                   # GLSL shaders
│   └── textures/                  # Texture files
└── CMakeLists.txt                 # CMake build configuration
```

## 🛠️ Requirements

- **Qt 6.2 or later**
- **CMake 3.16 or later**
- **C++17 compatible compiler**

## 🔨 Building

```bash
mkdir build && cd build
cmake ..
cmake --build .
./ExcavatorUI
```

## 🎯 Migration from Qt5 to Qt6

Fully migrated from Qt5/Qt3D to Qt6/QtQuick3D with:
- Scene3D → View3D
- Entity → Node/Model
- .obj → .glb models
- Modern PrincipledMaterial rendering

---

Built with ❤️ using Qt6 and QtQuick3D