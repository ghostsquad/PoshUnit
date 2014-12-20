﻿namespace PoshUnit {
    using System;
    using System.Management.Automation;

    public class TestCustomizationAttribute : Attribute {
        #region Constructors and Destructors

        public TestCustomizationAttribute(ScriptBlock command, params object[] callValues) {
            this.Command = command;
            this.CallValues = callValues;
        }

        #endregion

        #region Public Properties

        public ScriptBlock Command { get; set; }

        public object[] CallValues { get; set; }

        #endregion
    }
}