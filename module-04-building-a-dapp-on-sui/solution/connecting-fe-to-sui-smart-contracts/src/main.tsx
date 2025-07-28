import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import { SuiClientProvider,  WalletProvider } from '@mysten/dapp-kit';
import { getFullnodeUrl } from '@mysten/sui/client';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import '@mysten/dapp-kit/dist/index.css';



const queryClient = new QueryClient();
const networks = {
	testnet: { url: getFullnodeUrl('testnet') },
	mainnet: { url: getFullnodeUrl('mainnet') },
};

createRoot(document.getElementById('root')!).render(
  <QueryClientProvider client={queryClient}>
    <SuiClientProvider networks={networks} defaultNetwork="testnet">
	      <WalletProvider>
          <App />
        </WalletProvider>
    </SuiClientProvider>
	</QueryClientProvider>
)