export const transactionHash = hash => {
  console.log("transaction count: " + hash);
  
  const transactions = hash + 1;
  return {
      type: 'TRANSACTION_HASH',
      hash: transactions
  };
};

export const migrationID = idNum => {
  console.log("migration id: " + idNum);
  
  const migrations = idNum + 1;
  return {
      type: 'MIGRATION_ID',
      idNum: migrations
  };
};

export const incrementCount = count => {
  const num = count + 1
  return {
  type: 'INCREMENT_COUNT',
  count: num
  };
};

export const decrementCount = count => {
  const num = count - 1
  return {
    type: 'DECREMENT_COUNT',
    count: num
  };
};