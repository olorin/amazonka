{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IAM.GetGroup
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Returns a list of users that are in the specified group. You can
-- paginate the results using the @MaxItems@ and @Marker@ parameters.
--
-- <http://docs.aws.amazon.com/IAM/latest/APIReference/API_GetGroup.html>
module Network.AWS.IAM.GetGroup
    (
    -- * Request
      GetGroup
    -- ** Request constructor
    , getGroup
    -- ** Request lenses
    , ggrqMaxItems
    , ggrqMarker
    , ggrqGroupName

    -- * Response
    , GetGroupResponse
    -- ** Response constructor
    , getGroupResponse
    -- ** Response lenses
    , ggrsMarker
    , ggrsIsTruncated
    , ggrsStatus
    , ggrsGroup
    , ggrsUsers
    ) where

import           Network.AWS.IAM.Types
import           Network.AWS.Pager
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'getGroup' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ggrqMaxItems'
--
-- * 'ggrqMarker'
--
-- * 'ggrqGroupName'
data GetGroup = GetGroup'
    { _ggrqMaxItems  :: !(Maybe Nat)
    , _ggrqMarker    :: !(Maybe Text)
    , _ggrqGroupName :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'GetGroup' smart constructor.
getGroup :: Text -> GetGroup
getGroup pGroupName_ =
    GetGroup'
    { _ggrqMaxItems = Nothing
    , _ggrqMarker = Nothing
    , _ggrqGroupName = pGroupName_
    }

-- | Use this only when paginating results to indicate the maximum number of
-- items you want in the response. If there are additional items beyond the
-- maximum you specify, the @IsTruncated@ response element is @true@.
--
-- This parameter is optional. If you do not include it, it defaults to
-- 100.
ggrqMaxItems :: Lens' GetGroup (Maybe Natural)
ggrqMaxItems = lens _ggrqMaxItems (\ s a -> s{_ggrqMaxItems = a}) . mapping _Nat;

-- | Use this parameter only when paginating results and only after you have
-- received a response where the results are truncated. Set it to the value
-- of the @Marker@ element in the response you just received.
ggrqMarker :: Lens' GetGroup (Maybe Text)
ggrqMarker = lens _ggrqMarker (\ s a -> s{_ggrqMarker = a});

-- | The name of the group.
ggrqGroupName :: Lens' GetGroup Text
ggrqGroupName = lens _ggrqGroupName (\ s a -> s{_ggrqGroupName = a});

instance AWSPager GetGroup where
        page rq rs
          | stop (rs ^. ggrsIsTruncated) = Nothing
          | isNothing (rs ^. ggrsMarker) = Nothing
          | otherwise =
            Just $ rq & ggrqMarker .~ rs ^. ggrsMarker

instance AWSRequest GetGroup where
        type Sv GetGroup = IAM
        type Rs GetGroup = GetGroupResponse
        request = post
        response
          = receiveXMLWrapper "GetGroupResult"
              (\ s h x ->
                 GetGroupResponse' <$>
                   (x .@? "Marker") <*> (x .@? "IsTruncated") <*>
                     (pure (fromEnum s))
                     <*> (x .@ "Group")
                     <*>
                     (x .@? "Users" .!@ mempty >>= parseXMLList "member"))

instance ToHeaders GetGroup where
        toHeaders = const mempty

instance ToPath GetGroup where
        toPath = const "/"

instance ToQuery GetGroup where
        toQuery GetGroup'{..}
          = mconcat
              ["Action" =: ("GetGroup" :: ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "MaxItems" =: _ggrqMaxItems, "Marker" =: _ggrqMarker,
               "GroupName" =: _ggrqGroupName]

-- | Contains the response to a successful GetGroup request.
--
-- /See:/ 'getGroupResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ggrsMarker'
--
-- * 'ggrsIsTruncated'
--
-- * 'ggrsStatus'
--
-- * 'ggrsGroup'
--
-- * 'ggrsUsers'
data GetGroupResponse = GetGroupResponse'
    { _ggrsMarker      :: !(Maybe Text)
    , _ggrsIsTruncated :: !(Maybe Bool)
    , _ggrsStatus      :: !Int
    , _ggrsGroup       :: !Group
    , _ggrsUsers       :: ![User]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'GetGroupResponse' smart constructor.
getGroupResponse :: Int -> Group -> GetGroupResponse
getGroupResponse pStatus_ pGroup_ =
    GetGroupResponse'
    { _ggrsMarker = Nothing
    , _ggrsIsTruncated = Nothing
    , _ggrsStatus = pStatus_
    , _ggrsGroup = pGroup_
    , _ggrsUsers = mempty
    }

-- | When @IsTruncated@ is @true@, this element is present and contains the
-- value to use for the @Marker@ parameter in a subsequent pagination
-- request.
ggrsMarker :: Lens' GetGroupResponse (Maybe Text)
ggrsMarker = lens _ggrsMarker (\ s a -> s{_ggrsMarker = a});

-- | A flag that indicates whether there are more items to return. If your
-- results were truncated, you can make a subsequent pagination request
-- using the @Marker@ request parameter to retrieve more items.
ggrsIsTruncated :: Lens' GetGroupResponse (Maybe Bool)
ggrsIsTruncated = lens _ggrsIsTruncated (\ s a -> s{_ggrsIsTruncated = a});

-- | FIXME: Undocumented member.
ggrsStatus :: Lens' GetGroupResponse Int
ggrsStatus = lens _ggrsStatus (\ s a -> s{_ggrsStatus = a});

-- | Information about the group.
ggrsGroup :: Lens' GetGroupResponse Group
ggrsGroup = lens _ggrsGroup (\ s a -> s{_ggrsGroup = a});

-- | A list of users in the group.
ggrsUsers :: Lens' GetGroupResponse [User]
ggrsUsers = lens _ggrsUsers (\ s a -> s{_ggrsUsers = a});