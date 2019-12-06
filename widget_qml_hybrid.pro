#-------------------------------------------------
#
# Project created by QtCreator 2019-11-22T11:08:49
#
#-------------------------------------------------

QT       += core gui qml quickwidgets

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = widget_qml_hybrid
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

SOURCES += \
        main.cpp \
        mainwindow.cpp \
    recommend_list_model.cpp \
    form_child_widget.cpp

HEADERS += \
        mainwindow.h \
    form_child_widget.h \
    recommend_list_model.h \
    form_child_widget.h

FORMS += \
        mainwindow.ui \
    form_child_widget.ui \
    form_child_widget.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


include ($$PWD/qml/qml.pri)

RESOURCES += \
    res.qrc




