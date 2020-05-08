const Transaction = require('../models/Transaction');

/**
 * @description Get all transactions
 * @route       GET /api/v1/transactions
 * @access      Public
 */
exports.getTransactions = async (req, res, next) => {
  try {
    const transactions = await Transaction.find();
    return res.status(200).json(transactions);
    // return res.status(200).json({
    //   success: true,
    //   count: transactions.length,
    //   data: transactions
    // });
  } catch (err) {
    return res.status(500).json({
      success: false,
      error: {
        message: 'Server Error'
      }
    });
  }
};

/**
 * @description Add transaction
 * @route       POST /api/v1/transactions
 * @access      Public
 */
exports.addTransaction = async (req, res, next) => {
  try {
    const transaction = await Transaction.create(req.body);

    return res.status(201).json({
      success: true,
      data: transaction
    });
  } catch (err) {
    if (err.name === 'ValidationError') {
      const messages = Object.values(err.errors).map(el => el.message);

      return res.status(400).json({
        success: false,
        error: {
          message: messages
        }
      });
    }

    return res.status(500).json({
      success: false,
      error: {
        message: 'Server Error'
      }
    });
  }
};

/**
 * @description Delete transaction
 * @route       DELETE /api/v1/transactions/:id
 * @access      Public
 */
exports.deleteTransaction = async (req, res, next) => {
  try {
    const transaction = await Transaction.findById(req.params.id);

    if (!transaction) {
      return res.status(404).json({
        success: false,
        error: {
          message: `Transaction with ID ${req.params.id} not found`
        }
      });
    }

    await transaction.remove();

    return res.status(200).json({
      success: true,
      data: `${transaction.text} successfully removed`
    });
  } catch (err) {
    return res.status(500).json({
      success: false,
      error: {
        message: 'Server Error'
      }
    });
  }
};