/**************************************************************************
** Copyright(c) 2012-2019  hujiang All Rights Reserved
** Name:        CCtalk  recommend_list_model.cpp
** Purpose:
** Author:      liuguoyuan
** Modified by:
** Created:     2019/11/27
** RCS-ID:
** Licence:
**************************************************************************/
#include "recommend_list_model.h"
#include <QtDebug>
RecommendListModel::RecommendListModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

int RecommendListModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;
    return m_data.size();
}

QVariant RecommendListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    auto item = m_data.at(index.row());

    switch (role) {
    case Role_CategoryName:
        return item.categoryName;
    case Role_ContentId:
        return item.contentId;
    case Role_ContentName:
        return item.contentName;
    case Role_CoverUrl:
        return item.coverUrl;
    case Role_CreatorName:
        return item.createUserName;
    case Role_IsTry:
        return item.isTry;
    case Role_LinkUrl:
        return item.linkUrl;
    case Role_ShowCount:
        return item.showCount;
    case Role_CountType:
        return item.countType;
    case Role_IsCoupon:
        return item.isCoupon;
    case Role_OrigianlPrice:
        return item.originalPrice;
    case Role_CurrentPrice:
        return item.currentPrice;
    case Role_ActivityName:
        return item.activityName;
    case Role_HasDaKa:
        return item.hasDaKa;
    case Role_Tag:
        return item.tagList.front();
    case Role_ActivityType:
        return item.activityType;
    default:
        break;
    }

    return QVariant();
}

QHash<int, QByteArray> RecommendListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    // role names will be use in qml files.
    roles[Role_CategoryName] = "categoryName";
    roles[Role_ContentId] = "contentID";
    roles[Role_ContentName] = "contentName";
    roles[Role_CoverUrl] = "coverUrl";
    roles[Role_CreatorName] = "creatorName";
    roles[Role_IsTry] = "isTry";
    roles[Role_LinkUrl] = "linkUrl";
    roles[Role_ShowCount] = "showCount";
    roles[Role_CountType] = "countType";
    roles[Role_IsCoupon] = "isCoupon";
    roles[Role_OrigianlPrice] = "originalPrice";
    roles[Role_CurrentPrice] = "currentPrice";
    roles[Role_ActivityName] = "activityName";
    roles[Role_HasDaKa] = "hasDaKa";
    roles[Role_Tag] = "tag";
    roles[Role_ActivityType] = "activityType";
    return roles;
}

void RecommendListModel::addRecommend()
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    sRecommend d = {
        /*.categoryName   = */"撒地方",
        /*.contentId      = */123743,
        /*.contentName    = */"字体设计修炼设计大脑字体设计修炼字体设计修炼设计大脑字体设计修炼",
        /*.contentType    = */1,
        /*.coverUrl       = */"https://static.oschina.net/uploads/space/2018/0330/193750_LPcO_2896894.png",
        /*.createUserName = */"刘国元",
        /*.isTry          = */false,
        /*.linkUrl        = */"https://my.oschina.net/fileoptions/blog/1633021",
        /*.showCount      = */745,
        /*.countType      = */1,
        /*.isCoupon       = */true,
        /*.originalPrice  = */199.98,
        /*.currentPrice   = */99.99,
        /*.activityName   = */"限时优惠优惠",
        /*.hasDaKa        = */false,
        /*.tagList        = */[&](){
                                std::vector<QString> tagList;
                                tagList.push_back("英语");
                                return tagList;
                              }(),
        /*.activityType   = */1
    };
    m_data.push_back(d);
    endInsertRows();
}
