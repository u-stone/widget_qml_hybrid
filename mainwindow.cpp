/**************************************************************************
** Copyright(c) 2012-2019  hujiang All Rights Reserved
** Name:        CCtalk  mainwindow.cpp
** Purpose:
** Author:      liuguoyuan
** Modified by:
** Created:     2019/11/22
** RCS-ID:
** Licence:
**************************************************************************/
#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QQmlEngine>
#include <QQuickWidget>
#include <QBoxLayout>
#include <QQmlContext>
#include <QQuickView>

#include "form_child_widget.h"

#define SHOW_ONLY_RECOMMEND

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    // step 1 : register the C++ class to let qml know that here is a new qml object type.
    qmlRegisterType<MyObject>("com.hujiang.qt.MyObject", 1, 0, "MyObject");
    qmlRegisterType<FormChildWidget>("com.hujiang.qt.FormChildWidget", 1, 0, "FormChildWidget");

    QBoxLayout *layout = new QHBoxLayout();
    ui->centralWidget->setLayout(layout);

#ifndef SHOW_ONLY_RECOMMEND
    // step 2 : use QQuickWidget to load qml file, so that it can be add into normal QWidget.
    QQuickWidget *view = new QQuickWidget();
    view->setSource(QUrl(QStringLiteral("qrc:/qml/qml_listview.qml")));

    // step 3 : add to widget
    layout->addWidget(view);

    QStringList dataList;
    dataList.append("QStringList model");
    dataList.append("Item 1");
    dataList.append("Item 2");
    dataList.append("Item 3");
    dataList.append("Item 4");

    QQuickWidget *modle_view = new QQuickWidget();
    modle_view->setSource(QUrl(QStringLiteral("qrc:/qml/model_view.qml")));
    layout->addWidget(modle_view);

    QQuickWidget *simple_list_view = new QQuickWidget();
    QQmlContext *ctx_simple_list_view = simple_list_view->rootContext();
    ctx_simple_list_view->setContextProperty("simple_list_model", QVariant::fromValue(dataList));
    simple_list_view->setSource(QUrl(QStringLiteral("qrc:/qml/simple_list_model.qml")));
    layout->addWidget(simple_list_view);
#endif

    for (int i = 0; i < 10; i++) {
        m_model.addRecommend();
    }

    QQuickWidget *recommend_view = new QQuickWidget();
    layout->addWidget(recommend_view);
    recommend_view->setResizeMode(QQuickWidget::SizeRootObjectToView);
    QQmlContext* ctx_custom = recommend_view->rootContext();
    ctx_custom->setContextProperty("recomment_model", &m_model);
    recommend_view->setSource(QUrl(QStringLiteral("qrc:/qml/groupspace_recommend.qml")));
}

MainWindow::~MainWindow()
{
    delete ui;
}
