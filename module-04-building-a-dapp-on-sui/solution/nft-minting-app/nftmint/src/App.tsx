import { ConnectButton, useCurrentAccount, useSignAndExecuteTransaction, useSuiClient } from '@mysten/dapp-kit';
import { Transaction } from '@mysten/sui/transactions';
import { useState } from 'react';
import './index.css';
import { useNetworkVariable } from "./networkConfig";

export default function App() {
  const PackageId = useNetworkVariable("PackageId");
  const currentAccount = useCurrentAccount();
  const suiClient = useSuiClient();
  const { mutate: signAndExecute } = useSignAndExecuteTransaction();
  
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [imageUrl, setImageUrl] = useState('');
  const [waitingForTxn, setWaitingForTxn] = useState(false);
  const [txResult, setTxResult] = useState<string | null>(null);

  const handleMint = async () => {
    if (!currentAccount || !name || !description || !imageUrl) return;

    setWaitingForTxn(true);
    setTxResult(null);

    const tx = new Transaction();
    
    tx.moveCall({
      target: `${PackageId}::localnftmint::mint_nft`,
      arguments: [
        tx.pure.vector('u8', Array.from(new TextEncoder().encode(name))),
        tx.pure.vector('u8', Array.from(new TextEncoder().encode(description))),
        tx.pure.vector('u8', Array.from(new TextEncoder().encode(imageUrl)))
      ]
    });

    signAndExecute(
      {
        transaction: tx,
      },
      {
        onSuccess: (result) => {
          suiClient.waitForTransaction({ digest: result.digest }).then(() => {
            setTxResult(`Success! Digest: ${result.digest}`);
            setName('');
            setDescription('');
            setImageUrl('');
            setWaitingForTxn(false);
          });
        },
        onError: (error) => {
          console.error("Minting error:", error);
          setTxResult(`Error: ${error.message}`);
          setWaitingForTxn(false);
        },
      }
    );
  };

  return (
    <div className="p-5 max-w-md mx-auto">
      <h1 className="text-2xl font-bold mb-4">Sui NFT Minter</h1>
      
      <ConnectButton />
      
      {currentAccount && (
        <div className="mt-5">
          <div className="mb-4">
            <label className="block text-sm font-medium mb-1">Name:</label>
            <input
              type="text"
              value={name}
              onChange={(e) => setName(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              placeholder="Enter NFT name"
            />
          </div>
          
          <div className="mb-4">
            <label className="block text-sm font-medium mb-1">Description:</label>
            <textarea
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md min-h-20 focus:outline-none focus:ring-2 focus:ring-blue-500"
              placeholder="Enter NFT description"
            />
          </div>
          
          <div className="mb-5">
            <label className="block text-sm font-medium mb-1">Image URL:</label>
            <input
              type="url"
              value={imageUrl}
              onChange={(e) => setImageUrl(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              placeholder="https://example.com/image.png"
            />
          </div>
          
          <button
            onClick={handleMint}
            disabled={waitingForTxn || !name || !description || !imageUrl}
            className={`w-full py-2 px-4 rounded-md font-medium transition-colors flex items-center justify-center gap-2 ${
              waitingForTxn || !name || !description || !imageUrl
                ? 'bg-gray-400 cursor-not-allowed text-white'
                : 'bg-blue-600 hover:bg-blue-700 text-white cursor-pointer'
            }`}
          >
            {waitingForTxn ? 'Minting...' : 'Mint NFT'}
          </button>
          
          {txResult && (
            <div className={`mt-5 p-3 rounded-md ${
              txResult.includes('Success') 
                ? 'bg-green-100 border border-green-300 text-green-800' 
                : 'bg-red-100 border border-red-300 text-red-800'
            }`}>
              {txResult}
            </div>
          )}
        </div>
      )}
    </div>
  );
}