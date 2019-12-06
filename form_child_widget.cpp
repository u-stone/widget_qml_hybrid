/**************************************************************************
** Copyright(c) 2012-2019  hujiang All Rights Reserved
** Name:        CCtalk  form_child_widget.cpp
** Purpose:
** Author:      liuguoyuan
** Modified by:
** Created:     2019/11/22
** RCS-ID:
** Licence:
**************************************************************************/
#include "form_child_widget.h"
#include "ui_form_child_widget.h"

FormChildWidget::FormChildWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::FormChildWidget)
{
    ui->setupUi(this);


}

FormChildWidget::~FormChildWidget()
{
    delete ui;
}

QString FormChildWidget::userName()
{
    return m_userName;
}

void FormChildWidget::setUserName(const QString &name)
{
    if (m_userName == name) {
        return ;
    }

    m_userName = name;
    emit userNameChanged();
}
