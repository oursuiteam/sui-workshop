import { ConnectButton, useCurrentAccount, useSuiClientQuery } from '@mysten/dapp-kit';

function App() {
	return (
		<div className="flex flex-col items-end mr-4 mt-4">
			<div>
				<ConnectButton />
			</div>

			<ConnectedAccount />
		</div>
	);
}

function ConnectedAccount() {
	const account = useCurrentAccount();

	if (!account) {
		return null;
	}

	return <div>
    Connected to {account.address}
    <OwnedObjects address={account.address} />
  </div>;
}

function OwnedObjects({ address }: { address: string }) {
	const { data } = useSuiClientQuery('getOwnedObjects', {
		owner: address,
	});
	if (!data) {
		return null;
	}

	return (
		<ul>
			{data.data.map((object) => (
				<li key={object.data?.objectId}>
					<a href={`https://example-explorer.com/object/${object.data?.objectId}`}>
						{object.data?.objectId}
					</a>
				</li>
			))}
		</ul>
	);
}

export default App;