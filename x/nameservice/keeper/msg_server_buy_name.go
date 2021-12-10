package keeper

import (
	"context"

	"github.com/cosmonaut/nameservice/x/nameservice/types"
	sdk "github.com/cosmos/cosmos-sdk/types"
)

func (k msgServer) BuyName(goCtx context.Context, msg *types.MsgBuyName) (*types.MsgBuyNameResponse, error) {
	ctx := sdk.UnwrapSDKContext(goCtx)

	// TODO: Handling the message
	_ = ctx

	// for idx, v := range msg.Md5 {
	// 	k.SetWhois(ctx, types.Whois{
	// 		Id:  msg.Index + uint64(idx),
	// 		Md5: v,
	// 	})
	// }

	return &types.MsgBuyNameResponse{}, nil
}
