/**************************************************************************
** Copyright(c) 2012-2019  hujiang All Rights Reserved
** Name:        CCtalk  main.cpp
** Purpose:
** Author:      liuguoyuan
** Modified by:
** Created:     2019/11/22
** RCS-ID:
** Licence:
**************************************************************************/
#include "form_child_widget.h"
#include "mainwindow.h"
#include <QApplication>
#include <QLibraryInfo>
#include <QQmlContext>
#include <QQuickView>
#include <QtDebug>

//#define SHOW_AS_QUICKVIEW

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QApplication a(argc, argv);

    qDebug() << QLibraryInfo::location(QLibraryInfo::Qml2ImportsPath);

#ifdef SHOW_AS_QML
    // load qml file as main window
    qmlRegisterType<FormChildWidget>("com.hujiang.qt.TestChildWidget", 1, 0, "TestChildWidget");

    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:/qml/qml_listview.qml")));
    view.show();
#elif defined (SHOW_AS_QUICKVIEW)

    QStringList dataList;
    dataList.append("Item 1");
    dataList.append("Item 2");
    dataList.append("Item 3");
    dataList.append("Item 4");

    QQuickView *list_view = new QQuickView();
    QQmlContext *ctx = list_view->rootContext();
    ctx->setContextProperty("simple_list_model", QVariant::fromValue(dataList));
    list_view->setSource(QUrl(QStringLiteral("qrc:/qml/model_view.qml")));
    list_view->show();
#else
    // or load qml in a QWidget
    MainWindow w;
    w.show();
#endif

    return a.exec();
}
