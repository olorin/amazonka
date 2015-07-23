{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Glacier.SetDataRetrievalPolicy
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- This operation sets and then enacts a data retrieval policy in the
-- region specified in the PUT request. You can set one policy per region
-- for an AWS account. The policy is enacted within a few minutes of a
-- successful PUT operation.
--
-- The set policy operation does not affect retrieval jobs that were in
-- progress before the policy was enacted. For more information about data
-- retrieval policies, see
-- <http://docs.aws.amazon.com/amazonglacier/latest/dev/data-retrieval-policy.html Amazon Glacier Data Retrieval Policies>.
--
-- <http://docs.aws.amazon.com/amazonglacier/latest/dev/api-SetDataRetrievalPolicy.html>
module Network.AWS.Glacier.SetDataRetrievalPolicy
    (
    -- * Request
      SetDataRetrievalPolicy
    -- ** Request constructor
    , setDataRetrievalPolicy
    -- ** Request lenses
    , sdrprqPolicy
    , sdrprqAccountId

    -- * Response
    , SetDataRetrievalPolicyResponse
    -- ** Response constructor
    , setDataRetrievalPolicyResponse
    ) where

import           Network.AWS.Glacier.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | SetDataRetrievalPolicy input.
--
-- /See:/ 'setDataRetrievalPolicy' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'sdrprqPolicy'
--
-- * 'sdrprqAccountId'
data SetDataRetrievalPolicy = SetDataRetrievalPolicy'
    { _sdrprqPolicy    :: !(Maybe DataRetrievalPolicy)
    , _sdrprqAccountId :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'SetDataRetrievalPolicy' smart constructor.
setDataRetrievalPolicy :: Text -> SetDataRetrievalPolicy
setDataRetrievalPolicy pAccountId_ =
    SetDataRetrievalPolicy'
    { _sdrprqPolicy = Nothing
    , _sdrprqAccountId = pAccountId_
    }

-- | The data retrieval policy in JSON format.
sdrprqPolicy :: Lens' SetDataRetrievalPolicy (Maybe DataRetrievalPolicy)
sdrprqPolicy = lens _sdrprqPolicy (\ s a -> s{_sdrprqPolicy = a});

-- | The @AccountId@ value is the AWS account ID. This value must match the
-- AWS account ID associated with the credentials used to sign the request.
-- You can either specify an AWS account ID or optionally a single
-- apos@-@apos (hyphen), in which case Amazon Glacier uses the AWS account
-- ID associated with the credentials used to sign the request. If you
-- specify your Account ID, do not include any hyphens (apos-apos) in the
-- ID.
sdrprqAccountId :: Lens' SetDataRetrievalPolicy Text
sdrprqAccountId = lens _sdrprqAccountId (\ s a -> s{_sdrprqAccountId = a});

instance AWSRequest SetDataRetrievalPolicy where
        type Sv SetDataRetrievalPolicy = Glacier
        type Rs SetDataRetrievalPolicy =
             SetDataRetrievalPolicyResponse
        request = putJSON
        response
          = receiveNull SetDataRetrievalPolicyResponse'

instance ToHeaders SetDataRetrievalPolicy where
        toHeaders = const mempty

instance ToJSON SetDataRetrievalPolicy where
        toJSON SetDataRetrievalPolicy'{..}
          = object ["Policy" .= _sdrprqPolicy]

instance ToPath SetDataRetrievalPolicy where
        toPath SetDataRetrievalPolicy'{..}
          = mconcat
              ["/", toText _sdrprqAccountId,
               "/policies/data-retrieval"]

instance ToQuery SetDataRetrievalPolicy where
        toQuery = const mempty

-- | /See:/ 'setDataRetrievalPolicyResponse' smart constructor.
data SetDataRetrievalPolicyResponse =
    SetDataRetrievalPolicyResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'SetDataRetrievalPolicyResponse' smart constructor.
setDataRetrievalPolicyResponse :: SetDataRetrievalPolicyResponse
setDataRetrievalPolicyResponse = SetDataRetrievalPolicyResponse'