/**************************************************************************
** Copyright(c) 2012-2019  hujiang All Rights Reserved
** Name:        CCtalk  form_child_widget.h
** Purpose:
** Author:      liuguoyuan
** Modified by:
** Created:     2019/11/22
** RCS-ID:
** Licence:
**************************************************************************/
#ifndef FORM_CHILD_WIDGET_H
#define FORM_CHILD_WIDGET_H

#include <QWidget>

namespace Ui {
class FormChildWidget;
}

class MyObject : public QObject {
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString age READ age WRITE setAge NOTIFY ageChanged)

public:
    QString name() {
        return m_name;
    }

    void setName(QString name) {
        m_name = name;
    }

    QString age() {
        return m_age;
    }

    void setAge(QString age) {
        m_age = age;
    }

signals:
    void nameChanged();
    void ageChanged();

private:
    QString m_name;
    QString m_age;
};

class FormChildWidget : public QWidget
{
    Q_OBJECT
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(MyObject* objname READ objname WRITE setObjname NOTIFY objnameChanged)

public:
    explicit FormChildWidget(QWidget *parent = nullptr);
    ~FormChildWidget();

    QString userName();
    void setUserName(const QString &name);

    MyObject* objname() {
        return m_obj;
    }
    void setObjname(MyObject *o) {
        m_obj = o;
    }

signals:
    void userNameChanged();
    void objnameChanged();

private:
    Ui::FormChildWidget *ui;
    QString m_userName;
    MyObject *m_obj = nullptr;
};

#endif // FORM_CHILD_WIDGET_H
