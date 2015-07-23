{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IAM.DeleteGroupPolicy
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified inline policy that is embedded in the specified
-- group.
--
-- A group can also have managed policies attached to it. To detach a
-- managed policy from a group, use DetachGroupPolicy. For more information
-- about policies, refer to
-- <http://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html Managed Policies and Inline Policies>
-- in the /Using IAM/ guide.
--
-- <http://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteGroupPolicy.html>
module Network.AWS.IAM.DeleteGroupPolicy
    (
    -- * Request
      DeleteGroupPolicy
    -- ** Request constructor
    , deleteGroupPolicy
    -- ** Request lenses
    , drqGroupName
    , drqPolicyName

    -- * Response
    , DeleteGroupPolicyResponse
    -- ** Response constructor
    , deleteGroupPolicyResponse
    ) where

import           Network.AWS.IAM.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteGroupPolicy' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'drqGroupName'
--
-- * 'drqPolicyName'
data DeleteGroupPolicy = DeleteGroupPolicy'
    { _drqGroupName  :: !Text
    , _drqPolicyName :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteGroupPolicy' smart constructor.
deleteGroupPolicy :: Text -> Text -> DeleteGroupPolicy
deleteGroupPolicy pGroupName_ pPolicyName_ =
    DeleteGroupPolicy'
    { _drqGroupName = pGroupName_
    , _drqPolicyName = pPolicyName_
    }

-- | The name (friendly name, not ARN) identifying the group that the policy
-- is embedded in.
drqGroupName :: Lens' DeleteGroupPolicy Text
drqGroupName = lens _drqGroupName (\ s a -> s{_drqGroupName = a});

-- | The name identifying the policy document to delete.
drqPolicyName :: Lens' DeleteGroupPolicy Text
drqPolicyName = lens _drqPolicyName (\ s a -> s{_drqPolicyName = a});

instance AWSRequest DeleteGroupPolicy where
        type Sv DeleteGroupPolicy = IAM
        type Rs DeleteGroupPolicy = DeleteGroupPolicyResponse
        request = post
        response = receiveNull DeleteGroupPolicyResponse'

instance ToHeaders DeleteGroupPolicy where
        toHeaders = const mempty

instance ToPath DeleteGroupPolicy where
        toPath = const "/"

instance ToQuery DeleteGroupPolicy where
        toQuery DeleteGroupPolicy'{..}
          = mconcat
              ["Action" =: ("DeleteGroupPolicy" :: ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "GroupName" =: _drqGroupName,
               "PolicyName" =: _drqPolicyName]

-- | /See:/ 'deleteGroupPolicyResponse' smart constructor.
data DeleteGroupPolicyResponse =
    DeleteGroupPolicyResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteGroupPolicyResponse' smart constructor.
deleteGroupPolicyResponse :: DeleteGroupPolicyResponse
deleteGroupPolicyResponse = DeleteGroupPolicyResponse'