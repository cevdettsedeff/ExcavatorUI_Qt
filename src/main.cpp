#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QSurfaceFormat>

int main(int argc, char *argv[])
{
    // Set default surface format for better 3D rendering
    QSurfaceFormat format;
    format.setSamples(4); // Enable multisampling for antialiasing
    QSurfaceFormat::setDefaultFormat(format);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Load main QML file from QML module
    // When using qt_add_qml_module, the path changes
    const QUrl url(QStringLiteral("qrc:/qt/qml/ExcavatorUI/main.qml"));

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.load(url);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
