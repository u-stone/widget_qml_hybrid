/**************************************************************************
** Copyright(c) 2012-2019  hujiang All Rights Reserved
** Name:        CCtalk  mainwindow.h
** Purpose:
** Author:      liuguoyuan
** Modified by:
** Created:     2019/11/22
** RCS-ID:
** Licence:
**************************************************************************/
#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

#include "recommend_list_model.h"
namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    Ui::MainWindow *ui;

    RecommendListModel m_model;
};

#endif // MAINWINDOW_H
