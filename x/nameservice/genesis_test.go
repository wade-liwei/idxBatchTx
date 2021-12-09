package nameservice_test

import (
	"testing"

	keepertest "github.com/cosmonaut/nameservice/testutil/keeper"
	"github.com/cosmonaut/nameservice/x/nameservice"
	"github.com/cosmonaut/nameservice/x/nameservice/types"
	"github.com/stretchr/testify/require"
)

func TestGenesis(t *testing.T) {
	genesisState := types.GenesisState{
		WhoisList: []types.Whois{
			{
				Id: 0,
			},
			{
				Id: 1,
			},
		},
		WhoisCount: 2,
		// this line is used by starport scaffolding # genesis/test/state
	}

	k, ctx := keepertest.NameserviceKeeper(t)
	nameservice.InitGenesis(ctx, *k, genesisState)
	got := nameservice.ExportGenesis(ctx, *k)
	require.NotNil(t, got)

	require.Len(t, got.WhoisList, len(genesisState.WhoisList))
	require.Subset(t, genesisState.WhoisList, got.WhoisList)
	require.Equal(t, genesisState.WhoisCount, got.WhoisCount)
	// this line is used by starport scaffolding # genesis/test/assert
}
