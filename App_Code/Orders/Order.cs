using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MP2_IT114L
{
    public class Order
    {
        public DateTime Date { get; set; }
        public byte[] RecordImage { get; set; }
        public string ProductName { get; set; }
        public string Account_ID { get; set; }
        public int Quantity { get; set; }
        public decimal Subtotal { get; set; }
    }
}