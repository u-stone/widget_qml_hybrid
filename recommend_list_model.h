/**************************************************************************
** Copyright(c) 2012-2019  hujiang All Rights Reserved
** Name:        CCtalk  recommend_list_model.h
** Purpose:
** Author:      liuguoyuan
** Modified by:
** Created:     2019/11/27
** RCS-ID:
** Licence:
**************************************************************************/
#ifndef RECOMMENDLISTMODEL_H
#define RECOMMENDLISTMODEL_H

#include <QAbstractListModel>

struct sRecommend {
    // ref: http://yapi.yeshj.com/project/48/interface/api/1270

    QString categoryName;
    quint32 contentId;      // group-ID or program-ID depends on contentType field
    QString contentName;
    quint32 contentType;    // 1.group 2. program
    QString coverUrl;
    QString createUserName;
    bool    isTry;
    QString linkUrl;
    quint32 showCount;
    quint32 countType;      // 0：hide，1：enrol num  2：study num
    bool    isCoupon;
    double  originalPrice;
    double  currentPrice;
    QString activityName;
    bool    hasDaKa;
    std::vector<QString> tagList;
    quint32 activityType;   //1：Assemble  3：Flash sale 4：Coupon reduction


#define COPY_FILED(f) f = o.f
    void copy(const sRecommend &o) {
        if (&o == this) {
            return ;
        }

        COPY_FILED(categoryName);
        COPY_FILED(contentId);
        COPY_FILED(contentName);
        COPY_FILED(contentType);
        COPY_FILED(coverUrl);
        COPY_FILED(createUserName);
        COPY_FILED(isTry);
        COPY_FILED(linkUrl);
        COPY_FILED(showCount);
        COPY_FILED(countType);
        COPY_FILED(isCoupon);
        COPY_FILED(originalPrice);
        COPY_FILED(currentPrice);
        COPY_FILED(activityName);
        COPY_FILED(hasDaKa);
        tagList.assign(o.tagList.begin(), o.tagList.end());
        COPY_FILED(activityType);
    }
#undef COPY_FILED

};

class RecommendListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit RecommendListModel(QObject *parent = nullptr);
    enum RecommendRoleNames {
        Role_CategoryName = Qt::UserRole + 1,
        Role_ContentId,
        Role_ContentName,
        Role_CoverUrl,
        Role_CreatorName,
        Role_IsTry,
        Role_LinkUrl,
        Role_ShowCount,
        Role_CountType,
        Role_IsCoupon,
        Role_OrigianlPrice,
        Role_CurrentPrice,
        Role_ActivityName,
        Role_HasDaKa,
        Role_Tag,
        Role_ActivityType
    };

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

protected:
    virtual QHash<int,QByteArray> roleNames() const override;

public:
    void addRecommend();
private:
    std::vector<sRecommend> m_data;
};

#endif // RECOMMENDLISTMODEL_H
