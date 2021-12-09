package types

import (
	"fmt"
)

// DefaultIndex is the default capability global index
const DefaultIndex uint64 = 1

// DefaultGenesis returns the default Capability genesis state
func DefaultGenesis() *GenesisState {
	return &GenesisState{
		WhoisList: []Whois{},
		// this line is used by starport scaffolding # genesis/types/default
	}
}

// Validate performs basic genesis state validation returning an error upon any
// failure.
func (gs GenesisState) Validate() error {
	// Check for duplicated ID in whois
	whoisIdMap := make(map[uint64]bool)
	whoisCount := gs.GetWhoisCount()
	for _, elem := range gs.WhoisList {
		if _, ok := whoisIdMap[elem.Id]; ok {
			return fmt.Errorf("duplicated id for whois")
		}
		if elem.Id >= whoisCount {
			return fmt.Errorf("whois id should be lower or equal than the last id")
		}
		whoisIdMap[elem.Id] = true
	}
	// this line is used by starport scaffolding # genesis/types/validate

	return nil
}
