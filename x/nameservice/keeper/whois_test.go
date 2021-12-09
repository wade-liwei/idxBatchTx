package keeper_test

import (
	"testing"

	keepertest "github.com/cosmonaut/nameservice/testutil/keeper"
	"github.com/cosmonaut/nameservice/x/nameservice/keeper"
	"github.com/cosmonaut/nameservice/x/nameservice/types"
	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/stretchr/testify/require"
)

func createNWhois(keeper *keeper.Keeper, ctx sdk.Context, n int) []types.Whois {
	items := make([]types.Whois, n)
	for i := range items {
		items[i].Id = keeper.AppendWhois(ctx, items[i])
	}
	return items
}

func TestWhoisGet(t *testing.T) {
	keeper, ctx := keepertest.NameserviceKeeper(t)
	items := createNWhois(keeper, ctx, 10)
	for _, item := range items {
		got, found := keeper.GetWhois(ctx, item.Id)
		require.True(t, found)
		require.Equal(t, item, got)
	}
}

func TestWhoisRemove(t *testing.T) {
	keeper, ctx := keepertest.NameserviceKeeper(t)
	items := createNWhois(keeper, ctx, 10)
	for _, item := range items {
		keeper.RemoveWhois(ctx, item.Id)
		_, found := keeper.GetWhois(ctx, item.Id)
		require.False(t, found)
	}
}

func TestWhoisGetAll(t *testing.T) {
	keeper, ctx := keepertest.NameserviceKeeper(t)
	items := createNWhois(keeper, ctx, 10)
	require.ElementsMatch(t, items, keeper.GetAllWhois(ctx))
}

func TestWhoisCount(t *testing.T) {
	keeper, ctx := keepertest.NameserviceKeeper(t)
	items := createNWhois(keeper, ctx, 10)
	count := uint64(len(items))
	require.Equal(t, count, keeper.GetWhoisCount(ctx))
}
